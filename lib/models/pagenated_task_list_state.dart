import 'package:flutter_todo_sample/models/task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagenated_task_list_state.freezed.dart';

@freezed
abstract class PagenatedTaskListState with _$PagenatedTaskListState {
  const factory PagenatedTaskListState({
    required List<Task> tasks,
    required int currentPage,
    required bool hasNextPage,
  }) = _PagenatedTaskListState;
}
