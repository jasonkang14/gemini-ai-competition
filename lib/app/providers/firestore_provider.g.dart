// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dietListHash() => r'1c9d093616a66a5803b7b38977956c6d291fba9b';

/// See also [dietList].
@ProviderFor(dietList)
final dietListProvider = AutoDisposeFutureProvider<List<Diet>>.internal(
  dietList,
  name: r'dietListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dietListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DietListRef = AutoDisposeFutureProviderRef<List<Diet>>;
String _$bloodSugarLevelListHash() =>
    r'ba2822a546b47718e5c40814b26500f0d70c7911';

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

/// See also [bloodSugarLevelList].
@ProviderFor(bloodSugarLevelList)
const bloodSugarLevelListProvider = BloodSugarLevelListFamily();

/// See also [bloodSugarLevelList].
class BloodSugarLevelListFamily
    extends Family<AsyncValue<List<BloodSugarLevel>>> {
  /// See also [bloodSugarLevelList].
  const BloodSugarLevelListFamily();

  /// See also [bloodSugarLevelList].
  BloodSugarLevelListProvider call(
    String collectionName,
  ) {
    return BloodSugarLevelListProvider(
      collectionName,
    );
  }

  @override
  BloodSugarLevelListProvider getProviderOverride(
    covariant BloodSugarLevelListProvider provider,
  ) {
    return call(
      provider.collectionName,
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
  String? get name => r'bloodSugarLevelListProvider';
}

/// See also [bloodSugarLevelList].
class BloodSugarLevelListProvider
    extends AutoDisposeFutureProvider<List<BloodSugarLevel>> {
  /// See also [bloodSugarLevelList].
  BloodSugarLevelListProvider(
    String collectionName,
  ) : this._internal(
          (ref) => bloodSugarLevelList(
            ref as BloodSugarLevelListRef,
            collectionName,
          ),
          from: bloodSugarLevelListProvider,
          name: r'bloodSugarLevelListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bloodSugarLevelListHash,
          dependencies: BloodSugarLevelListFamily._dependencies,
          allTransitiveDependencies:
              BloodSugarLevelListFamily._allTransitiveDependencies,
          collectionName: collectionName,
        );

  BloodSugarLevelListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.collectionName,
  }) : super.internal();

  final String collectionName;

  @override
  Override overrideWith(
    FutureOr<List<BloodSugarLevel>> Function(BloodSugarLevelListRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BloodSugarLevelListProvider._internal(
        (ref) => create(ref as BloodSugarLevelListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        collectionName: collectionName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<BloodSugarLevel>> createElement() {
    return _BloodSugarLevelListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BloodSugarLevelListProvider &&
        other.collectionName == collectionName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, collectionName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BloodSugarLevelListRef
    on AutoDisposeFutureProviderRef<List<BloodSugarLevel>> {
  /// The parameter `collectionName` of this provider.
  String get collectionName;
}

class _BloodSugarLevelListProviderElement
    extends AutoDisposeFutureProviderElement<List<BloodSugarLevel>>
    with BloodSugarLevelListRef {
  _BloodSugarLevelListProviderElement(super.provider);

  @override
  String get collectionName =>
      (origin as BloodSugarLevelListProvider).collectionName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
