// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductPageState {
  ProductPageStatus get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  Product? get product => throw _privateConstructorUsedError;

  /// Create a copy of ProductPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductPageStateCopyWith<ProductPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductPageStateCopyWith<$Res> {
  factory $ProductPageStateCopyWith(
          ProductPageState value, $Res Function(ProductPageState) then) =
      _$ProductPageStateCopyWithImpl<$Res, ProductPageState>;
  @useResult
  $Res call({ProductPageStatus status, String errorMessage, Product? product});

  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class _$ProductPageStateCopyWithImpl<$Res, $Val extends ProductPageState>
    implements $ProductPageStateCopyWith<$Res> {
  _$ProductPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = null,
    Object? product = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProductPageStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
    ) as $Val);
  }

  /// Create a copy of ProductPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductPageStateImplCopyWith<$Res>
    implements $ProductPageStateCopyWith<$Res> {
  factory _$$ProductPageStateImplCopyWith(_$ProductPageStateImpl value,
          $Res Function(_$ProductPageStateImpl) then) =
      __$$ProductPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProductPageStatus status, String errorMessage, Product? product});

  @override
  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class __$$ProductPageStateImplCopyWithImpl<$Res>
    extends _$ProductPageStateCopyWithImpl<$Res, _$ProductPageStateImpl>
    implements _$$ProductPageStateImplCopyWith<$Res> {
  __$$ProductPageStateImplCopyWithImpl(_$ProductPageStateImpl _value,
      $Res Function(_$ProductPageStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = null,
    Object? product = freezed,
  }) {
    return _then(_$ProductPageStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProductPageStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
    ));
  }
}

/// @nodoc

class _$ProductPageStateImpl implements _ProductPageState {
  const _$ProductPageStateImpl(
      {this.status = ProductPageStatus.initial,
      this.errorMessage = '',
      this.product});

  @override
  @JsonKey()
  final ProductPageStatus status;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  final Product? product;

  @override
  String toString() {
    return 'ProductPageState(status: $status, errorMessage: $errorMessage, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductPageStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage, product);

  /// Create a copy of ProductPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductPageStateImplCopyWith<_$ProductPageStateImpl> get copyWith =>
      __$$ProductPageStateImplCopyWithImpl<_$ProductPageStateImpl>(
          this, _$identity);
}

abstract class _ProductPageState implements ProductPageState {
  const factory _ProductPageState(
      {final ProductPageStatus status,
      final String errorMessage,
      final Product? product}) = _$ProductPageStateImpl;

  @override
  ProductPageStatus get status;
  @override
  String get errorMessage;
  @override
  Product? get product;

  /// Create a copy of ProductPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductPageStateImplCopyWith<_$ProductPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
