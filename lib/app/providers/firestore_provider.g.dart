// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dietHash() => r'd5934965c450ad7b0b8e8b286779e1dba45196c9';

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

/// See also [diet].
@ProviderFor(diet)
const dietProvider = DietFamily();

/// See also [diet].
class DietFamily extends Family<AsyncValue<Diet>> {
  /// See also [diet].
  const DietFamily();

  /// See also [diet].
  DietProvider call(
    String timestamp,
  ) {
    return DietProvider(
      timestamp,
    );
  }

  @override
  DietProvider getProviderOverride(
    covariant DietProvider provider,
  ) {
    return call(
      provider.timestamp,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'dietProvider';
}

/// See also [diet].
class DietProvider extends AutoDisposeFutureProvider<Diet> {
  /// See also [diet].
  DietProvider(
    String timestamp,
  ) : this._internal(
          (ref) => diet(
            ref as DietRef,
            timestamp,
          ),
          from: dietProvider,
          name: r'dietProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$dietHash,
          dependencies: DietFamily._dependencies,
          allTransitiveDependencies: DietFamily._allTransitiveDependencies,
          timestamp: timestamp,
        );

  DietProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.timestamp,
  }) : super.internal();

  final String timestamp;

  @override
  Override overrideWith(
    FutureOr<Diet> Function(DietRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DietProvider._internal(
        (ref) => create(ref as DietRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        timestamp: timestamp,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Diet> createElement() {
    return _DietProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DietProvider && other.timestamp == timestamp;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, timestamp.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DietRef on AutoDisposeFutureProviderRef<Diet> {
  /// The parameter `timestamp` of this provider.
  String get timestamp;
}

class _DietProviderElement extends AutoDisposeFutureProviderElement<Diet>
    with DietRef {
  _DietProviderElement(super.provider);

  @override
  String get timestamp => (origin as DietProvider).timestamp;
}

String _$firestoreHash() => r'ffe0459b3e4a06734eb54bece72552e182ba610f';

/// See also [Firestore].
@ProviderFor(Firestore)
final firestoreProvider = AutoDisposeNotifierProvider<Firestore, void>.internal(
  Firestore.new,
  name: r'firestoreProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$firestoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Firestore = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
