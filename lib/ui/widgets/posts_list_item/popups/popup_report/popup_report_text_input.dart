import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mooncake/ui/ui.dart';

/// Represents the input that is used by the user to write something about
/// the report.
class PopupReportTextInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportPopupBloc, ReportPopupState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: TextFormField(
            autofocus: false,
            onChanged: (value) {
              BlocProvider.of<ReportPopupBloc>(context)
                  .add(ChangeOtherText(value));
            },
            decoration: InputDecoration(
              hintText: PostsLocalizations.of(context).reportPopupEditBotHint,
            ),
          ),
        );
      },
    );
  }
}