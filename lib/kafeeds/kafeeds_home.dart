import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_providers.dart';
import '../kaspa/kaspa.dart';
import '../social/social_models.dart';
import '../social/social_service.dart';
import '../social/kns_profile_service.dart';
import '../util/ui_util.dart';
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

void _openPostDetail(BuildContext context, KafeedsPost post) {
  Navigator.of(context).push(
    MaterialPageRoute<void>(
      builder: (_) => KafeedsPostDetailScreen(post: post),
    ),
  );
}

void _openThread(BuildContext context, KafeedsPost post) {
  _openPostDetail(context, post);
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
                      child: Text(
                        'K',
                        style: TextStyle(
                          color: _kafeedsBg,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
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
                      icon: const Icon(
                        Icons.close,
                        color: _kafeedsTextSecondary,
                      ),
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
                    style: const TextStyle(
                      color: _kafeedsText,
                      fontSize: 16,
                      height: 1.5,
                    ),
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () async {
                        final text = controller.text.trim();
                        if (text.isEmpty) return;
                        final result = await ref
                            .read(socialServiceProvider)
                            .createPost(text);
                        if (!mounted || !sheetContext.mounted) return;
                        Navigator.pop(sheetContext);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              result.success
                                  ? 'KaPosts transaction broadcast: ${result.transactionId}'
                                  : result.error ??
                                        'KaPosts transaction failed',
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
        position: Tween<Offset>(
          begin: const Offset(0, 0.025),
          end: Offset.zero,
        ).animate(feedAnimation),
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
                  BoxShadow(
                    color: Color(0x3300E5D4),
                    blurRadius: 16,
                    spreadRadius: 0,
                  ),
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
    final posts =
        feed.valueOrNull?.map((post) {
          return {
            'id': post.id,
            'post': post,
            'authorId': post.author.id,
            'username': post.author.handle,
            'handle': post.author.handle,
            'avatarUrl': post.author.avatarUrl,
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
        }).toList() ??
        const [];

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
              border: Border(
                bottom: BorderSide(color: _kafeedsBorder, width: 1),
              ),
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
                  icon: const Icon(
                    Icons.search_rounded,
                    color: _kafeedsText,
                    size: 24,
                  ),
                ),
                IconButton(
                  tooltip: 'Notifications',
                  onPressed: () => ref.invalidate(notificationsProvider),
                  icon: const Icon(
                    Icons.notifications_none_rounded,
                    color: _kafeedsText,
                    size: 24,
                  ),
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
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
                            child: Text(
                              'K',
                              style: TextStyle(
                                color: _kafeedsBg,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
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
                        for (final label in const [
                          'For You',
                          'Following',
                          'Popular',
                          'Latest',
                        ])
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 2,
                              ),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  border: label == 'For You'
                                      ? const Border(
                                          bottom: BorderSide(
                                            color: _kafeedsPrimary,
                                            width: 2,
                                          ),
                                        )
                                      : null,
                                ),
                                child: SizedBox(
                                  height: 44,
                                  child: Center(
                                    child: Text(
                                      label,
                                      style: TextStyle(
                                        color: label == 'For You'
                                            ? _kafeedsPrimary
                                            : _kafeedsTextTertiary,
                                        fontSize: 14,
                                        fontWeight: label == 'For You'
                                            ? FontWeight.w700
                                            : FontWeight.w500,
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
                    final selectedPost = post['post'] as KafeedsPost;
                    return InkWell(
                      onTap: () => _openPostDetail(context, selectedPost),
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
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
                                _ProfileAvatar(
                                  avatarUrl: post['avatarUrl'] as String?,
                                  fallbackName: post['username'] as String,
                                  radius: 22,
                                  backgroundColor: post['avatarColor'] as Color,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          if ((post['handle'] as String)
                                              .isNotEmpty)
                                            Text(
                                              post['handle'] as String,
                                              style: const TextStyle(
                                                color: _kafeedsTextSecondary,
                                                fontSize: 13,
                                              ),
                                            ),
                                          const Text(
                                            ' • ',
                                            style: TextStyle(
                                              color: _kafeedsTextTertiary,
                                            ),
                                          ),
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
                                    () => ref
                                        .read(socialServiceProvider)
                                        .follow(
                                          userId: post['authorId'] as String,
                                          follow: true,
                                        ),
                                  ),
                                  style: TextButton.styleFrom(
                                    foregroundColor: _kafeedsPrimary,
                                    minimumSize: const Size(0, 30),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
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
                                        color: _kafeedsPrimary.withValues(
                                          alpha: 0.15,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Icon(
                                        Icons.link_rounded,
                                        color: _kafeedsPrimary,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                _LikeButton(
                                  liked: post['liked'] == true,
                                  count: post['likes'] as int,
                                  onPressed: () async {
                                    final result = await ref
                                        .read(socialServiceProvider)
                                        .vote(
                                          postId: post['id'] as String,
                                          authorPubkey:
                                              post['authorId'] as String,
                                          upvote: true,
                                          cancel: post['liked'] == true,
                                        );
                                    if (!context.mounted) return result;
                                    if (result.success) {
                                      ref.invalidate(feedProvider);
                                    } else {
                                      UIUtil.showSnackbar(
                                        result.error ?? 'Like failed',
                                      );
                                    }
                                    return result;
                                  },
                                ),
                                const SizedBox(width: 8),
                                _ActionPill(
                                  icon: Icons.chat_bubble_outline_rounded,
                                  text: '${post['replies']}',
                                  onPressed: () => _openThread(
                                    context,
                                    selectedPost,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                _ActionPill(
                                  icon: Icons.repeat_rounded,
                                  text: '${post['reposts']}',
                                  onPressed: () => _runSocialWrite(
                                    context,
                                    ref,
                                    () => ref
                                        .read(socialServiceProvider)
                                        .quote(
                                          quoteId: post['id'] as String,
                                          quotedAuthorPubkey:
                                              post['authorId'] as String,
                                          text: '',
                                        ),
                                  ),
                                ),
                                const Spacer(),
                                _ActionPill(
                                  icon: post['bookmarked'] == true
                                      ? Icons.bookmark_rounded
                                      : Icons.bookmark_border_rounded,
                                  text: '',
                                  compact: true,
                                ),
                              ],
                            ),
                          ],
                        ),
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
  const _ActionPill({
    required this.icon,
    required this.text,
    this.compact = false,
    this.onPressed,
  });

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
        padding: EdgeInsets.symmetric(
          horizontal: compact ? 10 : 12,
          vertical: 8,
        ),
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
              Text(
                text,
                style: const TextStyle(
                  color: _kafeedsTextSecondary,
                  fontSize: 13,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _LikeButton extends StatefulWidget {
  const _LikeButton({
    required this.liked,
    required this.count,
    required this.onPressed,
  });

  final bool liked;
  final int count;
  final Future<KafeedsWriteResult> Function() onPressed;

  @override
  State<_LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<_LikeButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isSending = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 320),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _toggle() async {
    if (_isSending) return;
    setState(() => _isSending = true);
    try {
      final result = await widget.onPressed();
      if (result.success && mounted) {
        await _controller.forward(from: 0);
      }
    } finally {
      if (mounted) setState(() => _isSending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final scale = TweenSequence<double>(
      [
        TweenSequenceItem(tween: Tween(begin: 1, end: 1.22), weight: 42),
        TweenSequenceItem(tween: Tween(begin: 1.22, end: 1), weight: 58),
      ],
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    final opacity = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.7, end: 1), weight: 35),
      TweenSequenceItem(tween: Tween(begin: 1, end: 0.86), weight: 65),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    return InkWell(
      onTap: _toggle,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: _kafeedsCardAlt,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: _kafeedsBorder),
        ),
        child: Row(
          children: [
            FadeTransition(
              opacity: opacity,
              child: ScaleTransition(
                scale: scale,
                child: Icon(
                  widget.liked
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded,
                  size: 18,
                  color: widget.liked ? _kafeedsPrimary : _kafeedsTextSecondary,
                ),
              ),
            ),
            const SizedBox(width: 6),
            Text(
              '${widget.count}',
              style: const TextStyle(
                color: _kafeedsTextSecondary,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KafeedsPostDetailScreen extends ConsumerStatefulWidget {
  const KafeedsPostDetailScreen({super.key, required this.post});

  final KafeedsPost post;

  @override
  ConsumerState<KafeedsPostDetailScreen> createState() =>
      _KafeedsPostDetailScreenState();
}

class _KafeedsPostDetailScreenState
    extends ConsumerState<KafeedsPostDetailScreen> {
  final _commentController = TextEditingController();
  final FocusNode _replyFocusNode = FocusNode();
  bool _isSending = false;

  @override
  void dispose() {
    _commentController.dispose();
    _replyFocusNode.dispose();
    super.dispose();
  }

  Future<void> _sendReply() async {
    final text = _commentController.text.trim();
    if (text.isEmpty || _isSending) return;

    setState(() => _isSending = true);

    final result = await ref
        .read(socialServiceProvider)
        .reply(
          parentId: widget.post.id,
          parentAuthorPubkey: widget.post.author.id,
          text: text,
        );

    if (!mounted) return;

    if (!result.success) {
      setState(() => _isSending = false);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result.error ?? 'Reply failed')),
      );
      return;
    }

    _commentController.clear();
    ref.invalidate(postRepliesProvider(widget.post.id));
    setState(() => _isSending = false);
  }

  @override
  Widget build(BuildContext context) {
    final replies = ref.watch(postRepliesProvider(widget.post.id));

    return Scaffold(
      backgroundColor: _kafeedsBg,
      appBar: AppBar(
        backgroundColor: _kafeedsBg,
        foregroundColor: _kafeedsText,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.arrow_back_rounded, size: 28),
              ),
              const SizedBox(width: 8),
              const Text(
                'Postingan',
                style: TextStyle(
                  color: _kafeedsText,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _ProfileAvatar(
                                avatarUrl: widget.post.author.avatarUrl,
                                fallbackName: widget.post.author.username,
                                radius: 28,
                                backgroundColor: _kafeedsSecondary,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.post.author.displayName
                                                  ?.trim()
                                                  .isNotEmpty ==
                                              true
                                          ? widget.post.author.displayName!
                                          : widget.post.author.username,
                                      style: const TextStyle(
                                        color: _kafeedsText,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      '@${widget.post.author.username}',
                                      style: const TextStyle(
                                        color: _kafeedsTextSecondary,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.more_horiz,
                                  size: 24,
                                  color: _kafeedsTextSecondary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          Text(
                            widget.post.text,
                            style: const TextStyle(
                              color: Color(0xFFE8EDF2),
                              fontSize: 20,
                              height: 1.45,
                            ),
                          ),
                          if ((widget.post.urlPreviewTitle ?? '').isNotEmpty ||
                              (widget.post.urlPreviewHost ?? '').isNotEmpty)
                            Container(
                              margin: const EdgeInsets.only(top: 16),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: _kafeedsCard,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: _kafeedsBorder),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.post.urlPreviewTitle ?? '',
                                    style: const TextStyle(
                                      color: _kafeedsText,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    widget.post.urlPreviewHost ?? '',
                                    style: const TextStyle(
                                      color: _kafeedsTextSecondary,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          const SizedBox(height: 16),
                          Text(
                            DateFormat(
                              'd MMM yyyy • HH:mm',
                            ).format(widget.post.timestamp),
                            style: const TextStyle(
                              color: _kafeedsTextSecondary,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Divider(color: _kafeedsBorder, thickness: 1),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: _ActionPill(
                                  icon: Icons.chat_bubble_outline_rounded,
                                  text: '${widget.post.replies}',
                                  onPressed: () {
                                    if (_replyFocusNode.hasFocus) {
                                      _replyFocusNode.unfocus();
                                    }
                                    Future.microtask(
                                      () => _replyFocusNode.requestFocus(),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: _ActionPill(
                                  icon: Icons.repeat_rounded,
                                  text: '${widget.post.reposts}',
                                  onPressed: () => _runSocialWrite(
                                    context,
                                    ref,
                                    () => ref
                                        .read(socialServiceProvider)
                                        .quote(
                                          quoteId: widget.post.id,
                                          quotedAuthorPubkey:
                                              widget.post.author.id,
                                          text: '',
                                        ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: _LikeButton(
                                  liked: widget.post.isLiked,
                                  count: widget.post.likes,
                                  onPressed: () async {
                                    final result = await ref
                                        .read(socialServiceProvider)
                                        .vote(
                                          postId: widget.post.id,
                                          authorPubkey: widget.post.author.id,
                                          upvote: true,
                                          cancel: widget.post.isLiked,
                                        );
                                    if (!context.mounted) return result;
                                    if (result.success) {
                                      ref.invalidate(feedProvider);
                                      ref.invalidate(
                                        postRepliesProvider(widget.post.id),
                                      );
                                    }
                                    return result;
                                  },
                                ),
                              ),
                              const SizedBox(width: 8),
                              SizedBox(
                                width: 52,
                                child: _ActionPill(
                                  icon: widget.post.bookmarked
                                      ? Icons.bookmark_rounded
                                      : Icons.bookmark_border_rounded,
                                  text: '',
                                  compact: true,
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  replies.when(
                    loading: () => const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: _kafeedsPrimary,
                        ),
                      ),
                    ),
                    error: (error, _) => SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                        child: Text(
                          'Could not load replies: $error',
                          style: const TextStyle(color: _kafeedsTextSecondary),
                        ),
                      ),
                    ),
                    data: (items) {
                      if (items.isEmpty) {
                        return const SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
                            child: Text(
                              'Belum ada balasan',
                              style: TextStyle(color: _kafeedsTextSecondary),
                            ),
                          ),
                        );
                      }

                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => Container(
                            margin: const EdgeInsets.fromLTRB(24, 0, 24, 12),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: _kafeedsCard,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: _kafeedsBorder),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _ProfileAvatar(
                                  avatarUrl: items[index].author.avatarUrl,
                                  fallbackName: items[index].author.username,
                                  radius: 18,
                                  backgroundColor: _kafeedsSecondary,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            items[index].author.displayName
                                                        ?.trim()
                                                        .isNotEmpty ==
                                                    true
                                                ? items[index]
                                                      .author
                                                      .displayName!
                                                : items[index].author.username,
                                            style: const TextStyle(
                                              color: _kafeedsText,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(width: 6),
                                          Text(
                                            '@${items[index].author.username}',
                                            style: const TextStyle(
                                              color: _kafeedsTextSecondary,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        items[index].timeLabel,
                                        style: const TextStyle(
                                          color: _kafeedsTextTertiary,
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        items[index].text,
                                        style: const TextStyle(
                                          color: _kafeedsText,
                                          fontSize: 15,
                                          height: 1.45,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          childCount: items.length,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: _kafeedsBg,
                border: Border(
                  top: BorderSide(color: _kafeedsBorder, width: 1),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
              child: SafeArea(
                top: false,
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 22,
                      backgroundColor: _kafeedsPrimary,
                      child: Text(
                        'K',
                        style: TextStyle(
                          color: _kafeedsBg,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        decoration: BoxDecoration(
                          color: const Color(0xFF101820),
                          border: Border.all(color: _kafeedsBorder),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: TextField(
                          controller: _commentController,
                          focusNode: _replyFocusNode,
                          minLines: 1,
                          maxLines: 4,
                          style: const TextStyle(
                            color: _kafeedsText,
                            fontSize: 16,
                            height: 1.4,
                          ),
                          decoration: const InputDecoration(
                            hintText: 'Posting balasan Anda',
                            hintStyle: TextStyle(color: _kafeedsTextSecondary),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 14),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: _isSending ? null : _sendReply,
                      icon: const Icon(
                        Icons.send_rounded,
                        color: _kafeedsPrimary,
                        size: 26,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PostThreadScreen extends ConsumerStatefulWidget {
  const _PostThreadScreen({required this.post});

  final KafeedsPost post;

  @override
  ConsumerState<_PostThreadScreen> createState() => _PostThreadScreenState();
}

class _PostThreadScreenState extends ConsumerState<_PostThreadScreen> {
  final _commentController = TextEditingController();
  String? _status;
  bool _isSending = false;

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _sendReply() async {
    final text = _commentController.text.trim();
    if (text.isEmpty || _isSending) return;
    final previousReplyCount =
        ref.read(postRepliesProvider(widget.post.id)).valueOrNull?.length ?? 0;
    setState(() {
      _isSending = true;
      _status = 'Sending reply...';
    });
    final result = await ref
        .read(socialServiceProvider)
        .reply(
          parentId: widget.post.id,
          parentAuthorPubkey: widget.post.author.id,
          text: text,
        );
    if (!mounted) return;
    if (!result.success) {
      setState(() {
        _isSending = false;
        _status = result.error ?? 'Reply failed';
      });
      return;
    }
    _commentController.clear();
    var replyIndexed = false;
    for (var attempt = 0; attempt < 4; attempt++) {
      ref.invalidate(postRepliesProvider(widget.post.id));
      final replies = await ref.read(
        postRepliesProvider(widget.post.id).future,
      );
      if (replies.length > previousReplyCount) {
        replyIndexed = true;
        break;
      }
      if (attempt < 3) {
        await Future<void>.delayed(const Duration(seconds: 1));
      }
    }
    if (!mounted) return;
    setState(() {
      _isSending = false;
      _status = replyIndexed
          ? 'Reply sent.'
          : 'Reply sent. It is still waiting for the indexer.';
    });
  }

  @override
  Widget build(BuildContext context) {
    final replies = ref.watch(postRepliesProvider(widget.post.id));
    return Scaffold(
      backgroundColor: _kafeedsBg,
      appBar: AppBar(
        backgroundColor: _kafeedsBg,
        foregroundColor: _kafeedsText,
        title: const Text('Post'),
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: _ThreadPostTile(post: widget.post, isRoot: true),
                ),
                replies.when(
                  loading: () => const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  error: (error, _) => SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Text(
                        'Could not load replies: $error',
                        style: const TextStyle(color: _kafeedsTextSecondary),
                      ),
                    ),
                  ),
                  data: (items) => items.isEmpty
                      ? const SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(
                            child: Text(
                              'No replies yet',
                              style: TextStyle(color: _kafeedsTextSecondary),
                            ),
                          ),
                        )
                      : SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) =>
                                _ThreadPostTile(post: items[index]),
                            childCount: items.length,
                          ),
                        ),
                ),
              ],
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
              child: Column(
                children: [
                  if (_status != null)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _status!,
                        style: const TextStyle(
                          color: _kafeedsTextSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _commentController,
                          maxLength: 25000,
                          minLines: 1,
                          maxLines: 4,
                          enabled: !_isSending,
                          style: const TextStyle(color: _kafeedsText),
                          decoration: const InputDecoration(
                            hintText: 'Write a reply',
                            hintStyle: TextStyle(color: _kafeedsTextSecondary),
                            counterText: '',
                            filled: true,
                            fillColor: _kafeedsCard,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        tooltip: 'Send reply',
                        onPressed: _isSending ? null : _sendReply,
                        icon: const Icon(
                          Icons.send_rounded,
                          color: _kafeedsPrimary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ThreadPostTile extends StatelessWidget {
  const _ThreadPostTile({required this.post, this.isRoot = false});

  final KafeedsPost post;
  final bool isRoot;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, isRoot ? 10 : 0, 10, 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _kafeedsCard,
        border: Border.all(color: _kafeedsBorder),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _ProfileAvatar(
                avatarUrl: post.author.avatarUrl,
                fallbackName: post.author.handle,
                radius: 20,
                backgroundColor: _kafeedsSecondary,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  post.author.handle,
                  style: const TextStyle(
                    color: _kafeedsText,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                post.timeLabel,
                style: const TextStyle(
                  color: _kafeedsTextTertiary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            post.text,
            style: const TextStyle(
              color: _kafeedsText,
              fontSize: 16,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar({
    required this.avatarUrl,
    required this.fallbackName,
    required this.radius,
    required this.backgroundColor,
    this.borderColor,
    this.borderWidth = 0,
  });

  final String? avatarUrl;
  final String fallbackName;
  final double radius;
  final Color backgroundColor;
  final Color? borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    final url = avatarUrl?.trim();
    final safeFallback = fallbackName.isNotEmpty ? fallbackName : 'K';
    final initial = safeFallback.startsWith('@') && safeFallback.length > 1
        ? safeFallback.substring(1, 2).toUpperCase()
        : safeFallback.substring(0, 1).toUpperCase();
    final fallback = CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      child: Text(
        initial,
        style: const TextStyle(
          color: _kafeedsBg,
          fontWeight: FontWeight.w800,
        ),
      ),
    );

    final avatar = url == null || url.isEmpty
        ? fallback
        : CircleAvatar(
            radius: radius,
            backgroundColor: backgroundColor,
            child: ClipOval(
              child: Image.network(
                url,
                width: radius * 2,
                height: radius * 2,
                fit: BoxFit.cover,
                errorBuilder: (_, error, stackTrace) => fallback,
              ),
            ),
          );

    if (borderWidth <= 0 || borderColor == null) return avatar;
    return Container(
      padding: EdgeInsets.all(borderWidth),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor!, width: borderWidth),
      ),
      child: avatar,
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
                      style: TextStyle(
                        color: _kafeedsTextSecondary,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: ListView(
                children: const [
                  _SearchSection(
                    title: 'Trending',
                    items: ['#Kaspa', '#WalletUX', '#KRC20', '#Mining'],
                  ),
                  _SearchSection(
                    title: 'Communities',
                    items: [
                      'Kaspa Devs',
                      'Kaspa Daily',
                      'Kafeeds Community',
                      'Mining Updates',
                    ],
                  ),
                  _SearchSection(
                    title: 'People',
                    items: [
                      '@kaspa.dev',
                      '@kaspamint',
                      '@walletops',
                      '@communityfeed',
                    ],
                  ),
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: _kafeedsCardAlt,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: _kafeedsBorder),
                    ),
                    child: Text(
                      item,
                      style: const TextStyle(
                        color: _kafeedsTextSecondary,
                        fontSize: 13,
                      ),
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

class _ProfileTab extends ConsumerWidget {
  const _ProfileTab();

  String _storageKeyForProfile(String profileId) =>
      'kafeeds_profile_$profileId';

  KafeedsProfile _mergeSavedProfile(
    WidgetRef ref,
    String profileId,
    KafeedsProfile profile,
  ) {
    final prefs = ref.read(sharedPrefsProvider);
    final raw = prefs.getString(_storageKeyForProfile(profileId));
    if (raw == null || raw.trim().isEmpty) return profile;

    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map<String, dynamic>) return profile;

      final savedDisplayName = decoded['displayName']?.toString();
      final savedBio = decoded['bio']?.toString();
      final savedLocation = decoded['location']?.toString();
      final savedWebsite = decoded['website']?.toString();
      final savedAvatar = decoded['avatarUrl']?.toString();
      final savedCover = decoded['coverUrl']?.toString();

      return profile.copyWith(
        displayName:
            (savedDisplayName != null && savedDisplayName.trim().isNotEmpty)
            ? savedDisplayName
            : profile.displayName,
        bio: (savedBio != null && savedBio.trim().isNotEmpty)
            ? savedBio
            : profile.bio,
        location: (savedLocation != null && savedLocation.trim().isNotEmpty)
            ? savedLocation
            : profile.location,
        website: (savedWebsite != null && savedWebsite.trim().isNotEmpty)
            ? savedWebsite
            : profile.website,
        avatarUrl: (savedAvatar != null && savedAvatar.trim().isNotEmpty)
            ? savedAvatar
            : profile.avatarUrl,
        coverUrl: (savedCover != null && savedCover.trim().isNotEmpty)
            ? savedCover
            : profile.coverUrl,
      );
    } catch (_) {
      return profile;
    }
  }

  Future<void> _openEditProfile(
    BuildContext context,
    WidgetRef ref,
    KafeedsProfile profile,
  ) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => _EditProfileScreen(profile: profile),
      ),
    );
    ref.invalidate(profileProvider(profile.id));
  }

  Future<String> _currentProfileId(WidgetRef ref) async {
    final signer = ref.read(walletSignerProvider);
    final addresses = ref.read(addressNotifierProvider);
    final pubKey = await signer.publicKey(addresses.receiveAddress.address);
    return bytesToHex(pubKey);
  }

  String _profileErrorMessage(Object error) {
    final text = error.toString();
    if (text.contains('Unable to reach KaChat')) {
      return 'Unable to reach KaChat right now. Please check your network connection and try again.';
    }
    if (text.contains('KaChat returned an invalid response')) {
      return 'KaChat is temporarily unavailable. Please try again in a moment.';
    }
    if (text.contains('Could not load KaChat data')) {
      return 'Could not load your profile right now. Please try again.';
    }
    return 'Could not load profile. Please try again.';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<String>(
      future: _currentProfileId(ref),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: _kafeedsPrimary),
          );
        }

        final profileId = snapshot.data ?? '';
        if (profileId.isEmpty) {
          return const Center(
            child: Text(
              'Profile unavailable',
              style: TextStyle(color: _kafeedsTextSecondary),
            ),
          );
        }

        final profile = ref.watch(profileProvider(profileId));
        final profilePosts = ref.watch(profilePostsProvider(profileId));

        return profile.when(
          loading: () => const Center(
            child: CircularProgressIndicator(color: _kafeedsPrimary),
          ),
          error: (error, stackTrace) => Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                _profileErrorMessage(error),
                style: const TextStyle(color: _kafeedsTextSecondary),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          data: (profileData) {
            final savedProfile = _mergeSavedProfile(
              ref,
              profileId,
              profileData,
            );
            final knsProfile = ref.watch(knsOwnProfileProvider).valueOrNull;
            final effectiveProfile = savedProfile.copyWith(
              bio: knsProfile?.bio ?? savedProfile.bio,
              website: knsProfile?.website ?? savedProfile.website,
              avatarUrl: knsProfile?.avatarUrl ?? savedProfile.avatarUrl,
              coverUrl: knsProfile?.bannerUrl ?? savedProfile.coverUrl,
            );
            final tabs = [
              (
                key: 'posts',
                icon: Icons.grid_view_rounded,
                label: 'Posts',
              ),
              (
                key: 'saved',
                icon: Icons.bookmark_rounded,
                label: 'Saved',
              ),
              (
                key: 'reposts',
                icon: Icons.repeat_rounded,
                label: 'Reposts',
              ),
            ];

            final selectedTab = ValueNotifier<String>('posts');

            final posts = profilePosts.valueOrNull ?? const <KafeedsPost>[];

            return ValueListenableBuilder<String>(
              valueListenable: selectedTab,
              builder: (context, activeTab, _) {
                final tabPosts = switch (activeTab) {
                  'saved' => const <KafeedsPost>[],
                  'reposts' => const <KafeedsPost>[],
                  _ => posts,
                };

                return CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final coverHeight = constraints.maxWidth / 1.91;
                          return Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: double.infinity,
                                height: coverHeight,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF050B12),
                                  border: const Border(
                                    bottom: BorderSide(
                                      color: _kafeedsBorder,
                                      width: 1,
                                    ),
                                  ),
                                  image:
                                      (effectiveProfile.coverUrl ??
                                                  profileData.coverUrl) !=
                                              null &&
                                          (effectiveProfile.coverUrl ??
                                                  profileData.coverUrl)!
                                              .trim()
                                              .isNotEmpty
                                      ? DecorationImage(
                                          image: NetworkImage(
                                            (effectiveProfile.coverUrl ??
                                                profileData.coverUrl)!,
                                          ),
                                          fit: BoxFit.cover,
                                        )
                                      : null,
                                ),
                                child:
                                    (effectiveProfile.coverUrl ??
                                                profileData.coverUrl) ==
                                            null ||
                                        (effectiveProfile.coverUrl ??
                                                profileData.coverUrl)!
                                            .trim()
                                            .isEmpty
                                    ? Container(
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xFF050B12),
                                              Color(0xFF0B1720),
                                            ],
                                          ),
                                        ),
                                      )
                                    : null,
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: -52,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: _ProfileAvatar(
                                      avatarUrl: effectiveProfile.avatarUrl,
                                      fallbackName:
                                          effectiveProfile.username.isNotEmpty
                                          ? effectiveProfile.username
                                          : 'K',
                                      radius: 52,
                                      backgroundColor: _kafeedsSecondary,
                                      borderColor: const Color(0xFF00D9E8),
                                      borderWidth: 3,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        color: const Color(0xFF000000),
                        padding: const EdgeInsets.fromLTRB(16, 62, 16, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        effectiveProfile.displayName
                                                    ?.trim()
                                                    .isNotEmpty ==
                                                true
                                            ? effectiveProfile.displayName!
                                            : effectiveProfile
                                                  .username
                                                  .isNotEmpty
                                            ? effectiveProfile.username
                                            : 'Kafeeds User',
                                        style: const TextStyle(
                                          color: _kafeedsText,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: -0.4,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        effectiveProfile.username.isNotEmpty
                                            ? '@${effectiveProfile.username}'
                                            : '@kafeeds',
                                        style: const TextStyle(
                                          color: Color(0xFF9AA4B2),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => _openEditProfile(
                                    context,
                                    ref,
                                    effectiveProfile,
                                  ),
                                  child: Container(
                                    width: 26,
                                    height: 26,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(
                                      Icons.edit_rounded,
                                      size: 24,
                                      color: Color(0xFF00D9E8),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            if (profileData.bio != null &&
                                profileData.bio!.trim().isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 14),
                                child: Text(
                                  effectiveProfile.bio ?? profileData.bio!,
                                  style: const TextStyle(
                                    color: Color(0xFFB7C4CF),
                                    fontSize: 15,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            Wrap(
                              spacing: 16,
                              runSpacing: 10,
                              children: [
                                if (effectiveProfile.location != null &&
                                    effectiveProfile.location!
                                        .trim()
                                        .isNotEmpty)
                                  _ProfileMetaChip(
                                    icon: Icons.location_on_rounded,
                                    text: effectiveProfile.location!,
                                  ),
                                if (effectiveProfile.website != null &&
                                    effectiveProfile.website!.trim().isNotEmpty)
                                  _ProfileMetaChip(
                                    icon: Icons.link_rounded,
                                    text: effectiveProfile.website!,
                                  ),
                                if (profileData.birthDate != null)
                                  _ProfileMetaChip(
                                    icon: Icons.cake_rounded,
                                    text: _formatDate(profileData.birthDate!),
                                  ),
                                if (profileData.joinedAt != null)
                                  _ProfileMetaChip(
                                    icon: Icons.calendar_today_rounded,
                                    text:
                                        'Joined ${_formatMonthYear(profileData.joinedAt!)}',
                                  ),
                                _ProfileMetaChip(
                                  icon: Icons.people_rounded,
                                  text: '${profileData.following} Following',
                                ),
                                _ProfileMetaChip(
                                  icon: Icons.person_add_rounded,
                                  text: '${profileData.followers} Followers',
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            Container(
                              height: 54,
                              decoration: const BoxDecoration(
                                color: Color(0xFF050B12),
                                border: Border(
                                  bottom: BorderSide(
                                    color: _kafeedsBorder,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  for (final tab in tabs)
                                    Expanded(
                                      child: InkWell(
                                        onTap: () =>
                                            selectedTab.value = tab.key,
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                tab.icon,
                                                size: 22,
                                                color: activeTab == tab.key
                                                    ? const Color(0xFF00D9E8)
                                                    : const Color(0xFF8FA0B3),
                                              ),
                                              const SizedBox(width: 6),
                                              Text(
                                                tab.label,
                                                style: TextStyle(
                                                  color: activeTab == tab.key
                                                      ? const Color(0xFF00D9E8)
                                                      : const Color(0xFF8FA0B3),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            if (activeTab == 'posts')
                              Container(
                                height: 2,
                                width: 80,
                                margin: const EdgeInsets.only(top: -2),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF00D9E8),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              )
                            else if (activeTab == 'saved')
                              Container(
                                height: 2,
                                width: 80,
                                margin: const EdgeInsets.only(top: -2),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF00D9E8),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              )
                            else
                              Container(
                                height: 2,
                                width: 80,
                                margin: const EdgeInsets.only(top: -2),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF00D9E8),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    if (tabPosts.isEmpty)
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Container(
                          color: const Color(0xFF000000),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 32,
                          ),
                          child: Center(
                            child: Text(
                              activeTab == 'saved'
                                  ? 'No saved posts yet'
                                  : activeTab == 'reposts'
                                  ? 'No reposts yet'
                                  : 'No posts yet',
                              style: const TextStyle(
                                color: _kafeedsTextSecondary,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      )
                    else
                      SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final post = tabPosts[index];
                          return Container(
                            margin: const EdgeInsets.fromLTRB(10, 10, 10, 8),
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
                                    _ProfileAvatar(
                                      avatarUrl: post.author.avatarUrl,
                                      fallbackName: post.author.handle,
                                      radius: 20,
                                      backgroundColor: _kafeedsSecondary,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        post.author.handle,
                                        style: const TextStyle(
                                          color: _kafeedsText,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      post.timeLabel,
                                      style: const TextStyle(
                                        color: _kafeedsTextTertiary,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  post.text,
                                  style: const TextStyle(
                                    color: _kafeedsText,
                                    fontSize: 16,
                                    height: 1.45,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    _ActionPill(
                                      icon: Icons.favorite_border_rounded,
                                      text: '${post.likes}',
                                    ),
                                    const SizedBox(width: 8),
                                    _ActionPill(
                                      icon: Icons.chat_bubble_outline_rounded,
                                      text: '${post.replies}',
                                    ),
                                    const SizedBox(width: 8),
                                    _ActionPill(
                                      icon: Icons.repeat_rounded,
                                      text: '${post.reposts}',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }, childCount: tabPosts.length),
                      ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}

class _EditProfileScreen extends ConsumerStatefulWidget {
  const _EditProfileScreen({required this.profile});

  final KafeedsProfile profile;

  @override
  ConsumerState<_EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<_EditProfileScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _bioController;
  late final TextEditingController _locationController;
  late final TextEditingController _websiteController;

  final ImagePicker _picker = ImagePicker();
  XFile? _coverFile;
  XFile? _avatarFile;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: widget.profile.displayName ?? widget.profile.username,
    );
    _bioController = TextEditingController(text: widget.profile.bio ?? '');
    _locationController = TextEditingController(
      text: widget.profile.location ?? '',
    );
    _websiteController = TextEditingController(
      text: widget.profile.website ?? '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    _locationController.dispose();
    _websiteController.dispose();
    super.dispose();
  }

  Future<void> _pickImage({required bool isCover}) async {
    try {
      final file = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 90,
      );
      if (file == null || !mounted) return;
      setState(() {
        if (isCover) {
          _coverFile = file;
        } else {
          _avatarFile = file;
        }
      });
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unable to open the gallery.')),
      );
    }
  }

  Future<void> _saveProfile() async {
    if (_saving) return;
    setState(() => _saving = true);

    try {
      final hasMedia = _avatarFile != null || _coverFile != null;
      if (hasMedia) {
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (dialogContext) => AlertDialog(
            backgroundColor: _kafeedsCard,
            title: const Text(
              'Konfirmasi publikasi KNS',
              style: TextStyle(color: _kafeedsText),
            ),
            content: const Text(
              'KNS commit/reveal dan Kaspa network fee dihitung dinamis untuk setiap media.\n\nDeveloper fee: 10 KAS',
              style: TextStyle(color: _kafeedsTextSecondary, height: 1.4),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext, false),
                child: const Text('Batal'),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(dialogContext, true),
                child: const Text('Konfirmasi 10 KAS'),
              ),
            ],
          ),
        );
        if (confirmed != true) return;
      }

      var avatarUrl = widget.profile.avatarUrl;
      var coverUrl = widget.profile.coverUrl;
      if (hasMedia) {
        final published = await ref
            .read(knsProfileServiceProvider)
            .publish(
              current: widget.profile,
              avatar: _avatarFile,
              banner: _coverFile,
              displayName: _nameController.text.trim(),
              bio: _bioController.text.trim(),
              location: _locationController.text.trim(),
              website: _websiteController.text.trim(),
              onProgress: (message) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(message)),
                  );
                }
              },
            );
        avatarUrl = published.avatarUrl;
        coverUrl = published.coverUrl;
      }

      final prefs = await SharedPreferences.getInstance();

      final payload = jsonEncode({
        'displayName': _nameController.text.trim(),
        'bio': _bioController.text.trim(),
        'location': _locationController.text.trim(),
        'website': _websiteController.text.trim(),
        'avatarUrl': avatarUrl,
        'coverUrl': coverUrl,
      });

      await prefs.setString('kafeeds_profile_${widget.profile.id}', payload);

      if (!mounted) return;
      Navigator.of(context).pop();
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unable to save your profile.')),
      );
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final coverHeight = MediaQuery.sizeOf(context).width / 1.91;

    ImageProvider? coverImage;
    if (_coverFile != null) {
      coverImage = FileImage(File(_coverFile!.path));
    } else if (widget.profile.coverUrl != null &&
        widget.profile.coverUrl!.trim().isNotEmpty) {
      if (widget.profile.coverUrl!.startsWith('http')) {
        coverImage = NetworkImage(widget.profile.coverUrl!);
      } else if (File(widget.profile.coverUrl!).existsSync()) {
        coverImage = FileImage(File(widget.profile.coverUrl!));
      }
    }

    ImageProvider? avatarImage;
    if (_avatarFile != null) {
      avatarImage = FileImage(File(_avatarFile!.path));
    } else if (widget.profile.avatarUrl != null &&
        widget.profile.avatarUrl!.trim().isNotEmpty) {
      if (widget.profile.avatarUrl!.startsWith('http')) {
        avatarImage = NetworkImage(widget.profile.avatarUrl!);
      } else if (File(widget.profile.avatarUrl!).existsSync()) {
        avatarImage = FileImage(File(widget.profile.avatarUrl!));
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 8),
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 24,
          ),
        ),
        title: const Text(
          'Edit profil',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: TextButton(
              onPressed: _saving ? null : _saveProfile,
              child: Text(
                'Simpan',
                style: TextStyle(
                  color: _saving ? Colors.grey : Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    height: coverHeight,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0C1822),
                      border: const Border(
                        bottom: BorderSide(color: _kafeedsBorder, width: 1),
                      ),
                      image: coverImage != null
                          ? DecorationImage(
                              image: coverImage,
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                  ),
                  Positioned(
                    right: 14,
                    bottom: 14,
                    child: GestureDetector(
                      onTap: () => _pickImage(isCover: true),
                      child: Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: const Color(0xFF00D9E8),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: const Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.black,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    bottom: -52,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 104,
                          height: 104,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: _kafeedsBorder, width: 4),
                            color: _kafeedsCard,
                          ),
                          child: avatarImage != null
                              ? ClipOval(
                                  child: Image(
                                    image: avatarImage,
                                    fit: BoxFit.cover,
                                    width: 104,
                                    height: 104,
                                  ),
                                )
                              : const Icon(
                                  Icons.person_rounded,
                                  size: 46,
                                  color: _kafeedsTextSecondary,
                                ),
                        ),
                        Positioned(
                          right: -4,
                          bottom: -4,
                          child: GestureDetector(
                            onTap: () => _pickImage(isCover: false),
                            child: Container(
                              width: 38,
                              height: 38,
                              decoration: BoxDecoration(
                                color: const Color(0xFF00D9E8),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              child: const Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.black,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 66),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ProfileField(
                      label: 'Nama',
                      controller: _nameController,
                    ),
                    const SizedBox(height: 20),
                    _ProfileField(
                      label: 'Bio',
                      controller: _bioController,
                      maxLines: 4,
                    ),
                    const SizedBox(height: 20),
                    _ProfileField(
                      label: 'Lokasi',
                      controller: _locationController,
                    ),
                    const SizedBox(height: 20),
                    _ProfileField(
                      label: 'Situs web',
                      controller: _websiteController,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileField extends StatelessWidget {
  const _ProfileField({
    required this.label,
    required this.controller,
    this.maxLines = 1,
  });

  final String label;
  final TextEditingController controller;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF8FA0B3),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          maxLines: maxLines,
          minLines: maxLines,
          style: const TextStyle(
            color: Color(0xFFF5F7FA),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          decoration: const InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF18313D)),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF18313D)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF00D9E8)),
            ),
            contentPadding: EdgeInsets.only(bottom: 8),
          ),
        ),
      ],
    );
  }
}

class _ProfileMetaChip extends StatelessWidget {
  const _ProfileMetaChip({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF05131B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _kafeedsBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: const Color(0xFF9AA4B2)),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF9AA4B2),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

String _formatDate(DateTime date) {
  final months = <String>[
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  return '${date.day} ${months[date.month - 1]} ${date.year}';
}

String _formatMonthYear(DateTime date) {
  final months = <String>[
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  return '${months[date.month - 1]} ${date.year}';
}
