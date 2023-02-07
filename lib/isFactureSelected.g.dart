// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isFactureSelected.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$IsFactureSelectedHash() => r'1281fb3deaccdf94514ca93f1aab9db1ee604d18';

/// See also [IsFactureSelected].
class IsFactureSelectedProvider
    extends AutoDisposeNotifierProviderImpl<IsFactureSelected, bool> {
  IsFactureSelectedProvider(
    this.param,
  ) : super(
          () => IsFactureSelected()..param = param,
          from: isFactureSelectedProvider,
          name: r'isFactureSelectedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$IsFactureSelectedHash,
        );

  final dynamic param;

  @override
  bool operator ==(Object other) {
    return other is IsFactureSelectedProvider && other.param == param;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, param.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  bool runNotifierBuild(
    covariant _$IsFactureSelected notifier,
  ) {
    return notifier.build(
      param,
    );
  }
}

typedef IsFactureSelectedRef = AutoDisposeNotifierProviderRef<bool>;

/// See also [IsFactureSelected].
final isFactureSelectedProvider = IsFactureSelectedFamily();

class IsFactureSelectedFamily extends Family<bool> {
  IsFactureSelectedFamily();

  IsFactureSelectedProvider call(
    dynamic param,
  ) {
    return IsFactureSelectedProvider(
      param,
    );
  }

  @override
  AutoDisposeNotifierProviderImpl<IsFactureSelected, bool> getProviderOverride(
    covariant IsFactureSelectedProvider provider,
  ) {
    return call(
      provider.param,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'isFactureSelectedProvider';
}

abstract class _$IsFactureSelected extends BuildlessAutoDisposeNotifier<bool> {
  late final dynamic param;

  bool build(
    dynamic param,
  );
}
