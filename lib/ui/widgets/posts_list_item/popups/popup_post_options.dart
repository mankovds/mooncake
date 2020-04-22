import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mooncake/entities/entities.dart';
import 'package:mooncake/ui/ui.dart';

import 'popup_report/popup_report.dart';

/// Represents the popup that allows a user to perform some actions related
/// to a post such as reporting it.
class PostOptionsPopup extends StatelessWidget {
  final Post post;
  const PostOptionsPopup({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 150,
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              PostsLocalizations.of(context).postActionsPopupTitle,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 8),
            _buildItem(
              context: context,
              icon: MooncakeIcons.report,
              text: PostsLocalizations.of(context).postActionReport,
              action: () => _onReportClicked(context),
            ),
            _buildItem(
              context: context,
              icon: MooncakeIcons.eyeClose,
              text: PostsLocalizations.of(context).postActionHide,
              action: () => _onHideClicked(context),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildItem({
    BuildContext context,
    IconData icon,
    String text,
    Function action,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: action,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(icon, color: Theme.of(context).textTheme.bodyText2.color),
              const SizedBox(width: 16),
              Text(text, style: Theme.of(context).textTheme.bodyText2),
            ],
          ),
        ),
      ),
    );
  }

  void _onReportClicked(BuildContext context) {
    Navigator.pop(context);
    showDialog(
      context: context,
      child: BlocProvider<ReportPopupBloc>(
        create: (_) => ReportPopupBloc.create(post),
        child: ReportPostPopup(post: post),
      ),
    );
  }

  void _onHideClicked(BuildContext context) {
    Navigator.pop(context);
    BlocProvider.of<PostsListBloc>(context).add(HidePost(post));
  }
}
