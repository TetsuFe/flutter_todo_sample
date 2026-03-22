// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagenated_task_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PagenatedTaskListState {

 List<Task> get tasks; int get currentPage; bool get hasNextPage;
/// Create a copy of PagenatedTaskListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PagenatedTaskListStateCopyWith<PagenatedTaskListState> get copyWith => _$PagenatedTaskListStateCopyWithImpl<PagenatedTaskListState>(this as PagenatedTaskListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PagenatedTaskListState&&const DeepCollectionEquality().equals(other.tasks, tasks)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(tasks),currentPage,hasNextPage);

@override
String toString() {
  return 'PagenatedTaskListState(tasks: $tasks, currentPage: $currentPage, hasNextPage: $hasNextPage)';
}


}

/// @nodoc
abstract mixin class $PagenatedTaskListStateCopyWith<$Res>  {
  factory $PagenatedTaskListStateCopyWith(PagenatedTaskListState value, $Res Function(PagenatedTaskListState) _then) = _$PagenatedTaskListStateCopyWithImpl;
@useResult
$Res call({
 List<Task> tasks, int currentPage, bool hasNextPage
});




}
/// @nodoc
class _$PagenatedTaskListStateCopyWithImpl<$Res>
    implements $PagenatedTaskListStateCopyWith<$Res> {
  _$PagenatedTaskListStateCopyWithImpl(this._self, this._then);

  final PagenatedTaskListState _self;
  final $Res Function(PagenatedTaskListState) _then;

/// Create a copy of PagenatedTaskListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tasks = null,Object? currentPage = null,Object? hasNextPage = null,}) {
  return _then(_self.copyWith(
tasks: null == tasks ? _self.tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<Task>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasNextPage: null == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PagenatedTaskListState].
extension PagenatedTaskListStatePatterns on PagenatedTaskListState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PagenatedTaskListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PagenatedTaskListState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PagenatedTaskListState value)  $default,){
final _that = this;
switch (_that) {
case _PagenatedTaskListState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PagenatedTaskListState value)?  $default,){
final _that = this;
switch (_that) {
case _PagenatedTaskListState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Task> tasks,  int currentPage,  bool hasNextPage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PagenatedTaskListState() when $default != null:
return $default(_that.tasks,_that.currentPage,_that.hasNextPage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Task> tasks,  int currentPage,  bool hasNextPage)  $default,) {final _that = this;
switch (_that) {
case _PagenatedTaskListState():
return $default(_that.tasks,_that.currentPage,_that.hasNextPage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Task> tasks,  int currentPage,  bool hasNextPage)?  $default,) {final _that = this;
switch (_that) {
case _PagenatedTaskListState() when $default != null:
return $default(_that.tasks,_that.currentPage,_that.hasNextPage);case _:
  return null;

}
}

}

/// @nodoc


class _PagenatedTaskListState implements PagenatedTaskListState {
  const _PagenatedTaskListState({required final  List<Task> tasks, required this.currentPage, required this.hasNextPage}): _tasks = tasks;
  

 final  List<Task> _tasks;
@override List<Task> get tasks {
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tasks);
}

@override final  int currentPage;
@override final  bool hasNextPage;

/// Create a copy of PagenatedTaskListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PagenatedTaskListStateCopyWith<_PagenatedTaskListState> get copyWith => __$PagenatedTaskListStateCopyWithImpl<_PagenatedTaskListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PagenatedTaskListState&&const DeepCollectionEquality().equals(other._tasks, _tasks)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tasks),currentPage,hasNextPage);

@override
String toString() {
  return 'PagenatedTaskListState(tasks: $tasks, currentPage: $currentPage, hasNextPage: $hasNextPage)';
}


}

/// @nodoc
abstract mixin class _$PagenatedTaskListStateCopyWith<$Res> implements $PagenatedTaskListStateCopyWith<$Res> {
  factory _$PagenatedTaskListStateCopyWith(_PagenatedTaskListState value, $Res Function(_PagenatedTaskListState) _then) = __$PagenatedTaskListStateCopyWithImpl;
@override @useResult
$Res call({
 List<Task> tasks, int currentPage, bool hasNextPage
});




}
/// @nodoc
class __$PagenatedTaskListStateCopyWithImpl<$Res>
    implements _$PagenatedTaskListStateCopyWith<$Res> {
  __$PagenatedTaskListStateCopyWithImpl(this._self, this._then);

  final _PagenatedTaskListState _self;
  final $Res Function(_PagenatedTaskListState) _then;

/// Create a copy of PagenatedTaskListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tasks = null,Object? currentPage = null,Object? hasNextPage = null,}) {
  return _then(_PagenatedTaskListState(
tasks: null == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<Task>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasNextPage: null == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
