import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../social/social_models.dart';
import '../social/social_service.dart';
import '../wallet_home/wallet_home.dart';

const Color _kafeedsBg = Color(0xFF050B12);
const Color _kafeedsSurface = Color(0xFF08131C);
const Color _kafeedsCard = Color(0xFF0C1822);
const Color _kafeedsCardAlt = Color(0xFF101F2A);
const Color _kafeedsBorder = Color(0xFF18313D);
const Color _kafeedsPrimary = Color(0xFF00E5D4);
const Color _kafeedsSecondary = Color(0xFF14B8A6);
const Color _kafeedsText = Color(0xFFF4F8FA);
const Color _kafeedsTextSecondary = Color(0xFF94AAB5);
const Color _kafeedsTextTertiary = Color(0xFF667D88);

Future<void> _runSocialWrite(
  BuildContext context,
  WidgetRef ref,
  Future<KafeedsWriteResult> Function() write,
) async {
  late final KafeedsWriteResult result;
  try {
    result = await write();
  } catch (error) {
    result = KafeedsWriteResult(success: false, error: error.toString());
  }
  if (!context.mounted) return;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        result.success
            ? 'KaPosts transaction broadcast: ${result.transactionId}'
            : result.error ?? 'KaPosts transaction failed',
      ),
    ),
  );
  if (result.success) ref.invalidate(feedProvider);
}

Future<void> _openReplyComposer(
  BuildContext context,
  WidgetRef ref,
  String postId,
  String parentAuthorPubkey,
) async {
  final controller = TextEditingController();
  final text = await showDialog<String>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: const Text('Reply'),
      content: TextField(
        controller: controller,
        autofocus: true,
        maxLines: 5,
        maxLength: 25000,
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(dialogContext), child: const Text('Cancel')),
        FilledButton(onPressed: () => Navigator.pop(dialogContext, controller.text), child: const Text('Send')),
      ],
    ),
  );
  controller.dispose();
  if (text == null || text.trim().isEmpty || !context.mounted) return;
  await _runSocialWrite(
    context,
    ref,
    () => ref.read(socialServiceProvider).reply(
      parentId: postId,
      parentAuthorPubkey: parentAuthorPubkey,
      text: text.trim(),
    ),
  );
}

class KafeedsHome extends ConsumerStatefulWidget {
  const KafeedsHome({super.key});

  @override
  ConsumerState<KafeedsHome> createState() => _KafeedsHomeState();
}

class _KafeedsHomeState extends ConsumerState<KafeedsHome>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late final AnimationController _feedController;

  @override
  void initState() {
    super.initState();
    _feedController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 420),
    )..forward();
  }

  @override
  void dispose() {
    _feedController.dispose();
    super.dispose();
  }

  Future<void> _openCreatePostSheet() async {
    final controller = TextEditingController();
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return Container(
          margin: const EdgeInsets.only(top: 12),
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: _kafeedsSurface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            border: Border(top: BorderSide(color: _kafeedsBorder, width: 1)),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.sizeOf(context).height * 0.8,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: _kafeedsBorder,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: _kafeedsSecondary,
                      child: Text('K', style: TextStyle(color: _kafeedsBg, fontWeight: FontWeight.w800)),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Create post',
                        style: TextStyle(
                          color: _kafeedsText,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close, color: _kafeedsTextSecondary),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(minHeight: 140),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: _kafeedsCard,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: _kafeedsBorder),
                  ),
                  child: TextField(
                    controller: controller,
                    autofocus: true,
                    maxLines: 8,
                    maxLength: 25000,
                    style: const TextStyle(color: _kafeedsText, fontSize: 16, height: 1.5),
                    decoration: const InputDecoration(
                      hintText: 'What is happening in Kaspa today?',
                      hintStyle: TextStyle(color: _kafeedsTextSecondary),
                      border: InputBorder.none,
                      counterStyle: TextStyle(color: _kafeedsTextTertiary),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _ComposerAction(icon: Icons.image_outlined, label: 'Photo'),
                    const SizedBox(width: 8),
                    _ComposerAction(icon: Icons.link_outlined, label: 'Link'),
                    const SizedBox(width: 8),
                    _ComposerAction(icon: Icons.mood_outlined, label: 'Mood'),
                    const Spacer(),
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: _kafeedsPrimary,
                        foregroundColor: _kafeedsBg,
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () async {
                        final text = controller.text.trim();
                        if (text.isEmpty) return;
                        final result = await ref.read(socialServiceProvider).createPost(text);
                        if (!mounted || !sheetContext.mounted) return;
                        Navigator.pop(sheetContext);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              result.success
                                  ? 'KaPosts transaction broadcast: ${result.transactionId}'
                                  : result.error ?? 'KaPosts transaction failed',
                            ),
                          ),
                        );
                        if (result.success) ref.invalidate(feedProvider);
                      },
                      child: const Text('Post'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);

    final body = switch (_selectedIndex) {
      0 => _FeedTab(onCreate: _openCreatePostSheet),
      1 => _SearchTab(),
      3 => const WalletHome(),
      4 => _ProfileTab(),
      _ => _FeedTab(onCreate: _openCreatePostSheet),
    };

    final feedAnimation = CurvedAnimation(
      parent: _feedController,
      curve: Curves.easeOutCubic,
    );

    return FadeTransition(
      opacity: feedAnimation,
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(0, 0.025), end: Offset.zero)
            .animate(feedAnimation),
        child: Scaffold(
          backgroundColor: theme.backgroundDark,
          extendBody: true,
          body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 220),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        child: KeyedSubtree(
          key: ValueKey<int>(_selectedIndex),
          child: body,
        ),
      ),
          bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeInOut,
        height: 72,
        decoration: const BoxDecoration(
          color: _kafeedsSurface,
          border: Border(top: BorderSide(color: _kafeedsBorder, width: 1)),
        ),
        child: SafeArea(
          top: false,
          child: Row(
            children: [
              _BottomNavItem(
                icon: Icons.home_rounded,
                label: 'Feed',
                selected: _selectedIndex == 0,
                onTap: () => setState(() => _selectedIndex = 0),
              ),
              _BottomNavItem(
                icon: Icons.search_rounded,
                label: 'Search',
                selected: _selectedIndex == 1,
                onTap: () => setState(() => _selectedIndex = 1),
              ),
              _FloatingCreateButton(onPressed: _openCreatePostSheet),
              _BottomNavItem(
                icon: Icons.account_balance_wallet_rounded,
                label: 'Wallet',
                selected: _selectedIndex == 3,
                onTap: () => setState(() => _selectedIndex = 3),
              ),
              _BottomNavItem(
                icon: Icons.person_rounded,
                label: 'Profile',
                selected: _selectedIndex == 4,
                onTap: () => setState(() => _selectedIndex = 4),
              ),
            ],
          ),
        ),
          ),
        ),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: AnimatedScale(
          scale: selected ? 1.02 : 1.0,
          duration: const Duration(milliseconds: 120),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 24,
                color: selected ? _kafeedsPrimary : _kafeedsTextSecondary,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                  color: selected ? _kafeedsPrimary : _kafeedsTextSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FloatingCreateButton extends StatelessWidget {
  const _FloatingCreateButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: GestureDetector(
          onTap: onPressed,
          child: AnimatedScale(
            duration: const Duration(milliseconds: 100),
            scale: 0.96,
            child: Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: _kafeedsPrimary,
                boxShadow: [
                  BoxShadow(color: Color(0x3300E5D4), blurRadius: 16, spreadRadius: 0),
                ],
              ),
              child: const Icon(Icons.add_rounded, color: _kafeedsBg, size: 28),
            ),
          ),
        ),
      ),
    );
  }
}

class _ComposerAction extends StatelessWidget {
  const _ComposerAction({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: _kafeedsCardAlt,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _kafeedsBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: _kafeedsPrimary),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(color: _kafeedsTextSecondary, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _FeedTab extends ConsumerWidget {
  const _FeedTab({required this.onCreate});

  final VoidCallback onCreate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feed = ref.watch(feedProvider);
    final posts = feed.valueOrNull?.map((post) {
      return {
        'id': post.id,
        'authorId': post.author.id,
        'username': post.author.label,
        'handle': post.author.username,
        'time': post.timeLabel,
        'content': post.text,
        'likes': post.likes,
        'replies': post.replies,
        'reposts': post.reposts,
        'bookmarked': post.bookmarked,
        'liked': post.isLiked,
        'avatarColor': _kafeedsSecondary,
        'previewTitle': post.urlPreviewTitle ?? '',
        'previewHost': post.urlPreviewHost ?? '',
      };
    }).toList() ?? const [];

    if (feed.isLoading && posts.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 64,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
              color: _kafeedsBg,
              border: Border(bottom: BorderSide(color: _kafeedsBorder, width: 1)),
            ),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/kaspa_transparent_180.png',
                    width: 32,
                    height: 32,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'Kafeeds',
                    style: TextStyle(
                      color: _kafeedsText,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                IconButton(
                  tooltip: 'Search',
                  onPressed: () {},
                  icon: const Icon(Icons.search_rounded, color: _kafeedsText, size: 24),
                ),
                IconButton(
                  tooltip: 'Notifications',
                  onPressed: () => ref.invalidate(notificationsProvider),
                  icon: const Icon(Icons.notifications_none_rounded, color: _kafeedsText, size: 24),
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(12, 12, 12, 8),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: _kafeedsCard,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: _kafeedsBorder),
                    ),
                    child: InkWell(
                      onTap: onCreate,
                      borderRadius: BorderRadius.circular(14),
                      child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundColor: _kafeedsPrimary,
                          child: Text('K', style: TextStyle(color: _kafeedsBg, fontWeight: FontWeight.w800)),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Share an update…',
                            style: TextStyle(
                              color: _kafeedsTextSecondary,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 6, 16, 2),
                    child: Row(
                      children: [
                        for (final label in const ['For You', 'Following', 'Popular', 'Latest'])
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 2),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  border: label == 'For You'
                                      ? const Border(bottom: BorderSide(color: _kafeedsPrimary, width: 2))
                                      : null,
                                ),
                                child: SizedBox(
                                  height: 44,
                                  child: Center(
                                    child: Text(
                                      label,
                                      style: TextStyle(
                                        color: label == 'For You' ? _kafeedsPrimary : _kafeedsTextTertiary,
                                        fontSize: 14,
                                        fontWeight: label == 'For You' ? FontWeight.w700 : FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final post = posts[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: _kafeedsCard,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: _kafeedsBorder),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 22,
                                backgroundColor: post['avatarColor'] as Color,
                                child: Text(
                                  (post['username'] as String).substring(0, 1).toUpperCase(),
                                  style: const TextStyle(
                                    color: _kafeedsBg,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          post['username'] as String,
                                          style: const TextStyle(
                                            color: _kafeedsText,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          post['handle'] as String,
                                          style: const TextStyle(
                                            color: _kafeedsTextSecondary,
                                            fontSize: 13,
                                          ),
                                        ),
                                        const Text(' • ', style: TextStyle(color: _kafeedsTextTertiary)),
                                        Text(
                                          post['time'] as String,
                                          style: const TextStyle(
                                            color: _kafeedsTextTertiary,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () => _runSocialWrite(
                                  context,
                                  ref,
                                  () => ref.read(socialServiceProvider).follow(
                                    userId: post['authorId'] as String,
                                    follow: true,
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  foregroundColor: _kafeedsPrimary,
                                  minimumSize: const Size(0, 30),
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                ),
                                child: const Text('Follow'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            post['content'] as String,
                            style: const TextStyle(
                              color: _kafeedsText,
                              fontSize: 16,
                              height: 1.45,
                            ),
                          ),
                          const SizedBox(height: 12),
                          if ((post['previewTitle'] as String).isNotEmpty ||
                              (post['previewHost'] as String).isNotEmpty)
                            Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: _kafeedsCardAlt,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: _kafeedsBorder),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: _kafeedsPrimary.withValues(alpha: 0.15),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(Icons.link_rounded, color: _kafeedsPrimary),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        post['previewTitle'] as String,
                                        style: const TextStyle(
                                          color: _kafeedsText,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        post['previewHost'] as String,
                                        style: const TextStyle(
                                          color: _kafeedsTextSecondary,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              _ActionPill(
                                icon: post['liked'] == true ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                                text: '${post['likes']}',
                                onPressed: () => _runSocialWrite(
                                  context,
                                  ref,
                                  () => ref.read(socialServiceProvider).vote(
                                    postId: post['id'] as String,
                                    authorPubkey: post['authorId'] as String,
                                    upvote: true,
                                    cancel: post['liked'] == true,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              _ActionPill(
                                icon: Icons.chat_bubble_outline_rounded,
                                text: '${post['replies']}',
                                onPressed: () => _openReplyComposer(
                                  context,
                                  ref,
                                  post['id'] as String,
                                  post['authorId'] as String,
                                ),
                              ),
                              const SizedBox(width: 8),
                              _ActionPill(
                                icon: Icons.repeat_rounded,
                                text: '${post['reposts']}',
                                onPressed: () => _runSocialWrite(
                                  context,
                                  ref,
                                  () => ref.read(socialServiceProvider).quote(
                                    quoteId: post['id'] as String,
                                    quotedAuthorPubkey: post['authorId'] as String,
                                    text: '',
                                  ),
                                ),
                              ),
                              const Spacer(),
                              _ActionPill(
                                icon: post['bookmarked'] == true ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                                text: '',
                                compact: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }, childCount: posts.length),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionPill extends StatelessWidget {
  const _ActionPill({required this.icon, required this.text, this.compact = false, this.onPressed});

  final IconData icon;
  final String text;
  final bool compact;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: compact ? 10 : 12, vertical: 8),
        decoration: BoxDecoration(
          color: _kafeedsCardAlt,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: _kafeedsBorder),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: _kafeedsTextSecondary),
            if (!compact) ...[
              const SizedBox(width: 6),
              Text(text, style: const TextStyle(color: _kafeedsTextSecondary, fontSize: 13)),
            ],
          ],
        ),
      ),
    );
  }
}

class _SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: _kafeedsCard,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: _kafeedsBorder),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search_rounded, color: _kafeedsTextSecondary),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Search Kafeeds',
                      style: TextStyle(color: _kafeedsTextSecondary, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: ListView(
                children: const [
                  _SearchSection(title: 'Trending', items: ['#Kaspa', '#WalletUX', '#KRC20', '#Mining'] ),
                  _SearchSection(title: 'Communities', items: ['Kaspa Devs', 'Kaspa Daily', 'Kafeeds Community', 'Mining Updates']),
                  _SearchSection(title: 'People', items: ['@kaspa.dev', '@kaspamint', '@walletops', '@communityfeed']),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchSection extends StatelessWidget {
  const _SearchSection({required this.title, required this.items});

  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _kafeedsCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _kafeedsBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: _kafeedsText,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: items
                .map(
                  (item) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: _kafeedsCardAlt,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: _kafeedsBorder),
                    ),
                    child: Text(
                      item,
                      style: const TextStyle(color: _kafeedsTextSecondary, fontSize: 13),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Container(
              width: 88,
              height: 88,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [_kafeedsPrimary, _kafeedsSecondary],
                ),
              ),
              child: const Icon(Icons.person, size: 44, color: _kafeedsBg),
            ),
            const SizedBox(height: 16),
            const Text(
              'Kaspa User',
              style: TextStyle(
                color: _kafeedsText,
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              '@kaspa.user',
              style: TextStyle(color: _kafeedsTextSecondary, fontSize: 14),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                _ProfileStat(label: 'Posts', value: '128'),
                SizedBox(width: 20),
                _ProfileStat(label: 'Followers', value: '3.2k'),
                SizedBox(width: 20),
                _ProfileStat(label: 'Following', value: '482'),
              ],
            ),
            const SizedBox(height: 22),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _kafeedsCard,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: _kafeedsBorder),
              ),
              child: const Text(
                'Wallet-first, social-ready. Kafeeds keeps your Kaspa identity and security intact while adding a community layer around it.',
                style: TextStyle(color: _kafeedsTextSecondary, fontSize: 15, height: 1.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  const _ProfileStat({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: _kafeedsText,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: _kafeedsTextSecondary, fontSize: 12),
        ),
      ],
    );
  }
}
