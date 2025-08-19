import 'package:flutter/widgets.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/features/widgets/done_card.dart';
import 'package:property_ms/features/widgets/empty_card.dart';
import 'package:property_ms/features/widgets/error_network_card.dart';
import 'package:property_ms/features/widgets/loading_card.dart';

class StateHandler extends StatelessWidget {
  final LoadingState state;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final Widget? emptyWidget;
  final Widget? dataWidget;

  const StateHandler({
    super.key,
    required this.state,
    this.loadingWidget,
    this.errorWidget,
    this.emptyWidget,
    this.dataWidget,
  });

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case LoadingState.loading:
        return loadingWidget ?? const Center(child: LoadingCard(isSmall: true));
      case LoadingState.hasError:
        return errorWidget ?? const ErrorNetworkCard();
      case LoadingState.doneWithNoData:
        return emptyWidget ?? const EmptyCard(isSmall: true);
      case LoadingState.doneWithData:
        return dataWidget ?? const DoneCard(isSmall: true);
      default:
        return emptyWidget ?? const EmptyCard(isSmall: true);
    }
  }
}
