// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firestoreHash() => r'5620e953832445590c59220c69606a4df1e4ae7e';

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

/// See also [firestore].
@ProviderFor(firestore)
const firestoreProvider = FirestoreFamily();

/// See also [firestore].
class FirestoreFamily extends Family<AsyncValue<void>> {
  /// See also [firestore].
  const FirestoreFamily();

  /// See also [firestore].
  FirestoreProvider call(
    String collectionName,
  ) {
    return FirestoreProvider(
      collectionName,
    );
  }

  @override
  FirestoreProvider getProviderOverride(
    covariant FirestoreProvider provider,
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
  String? get name => r'firestoreProvider';
}

/// See also [firestore].
class FirestoreProvider extends AutoDisposeFutureProvider<void> {
  /// See also [firestore].
  FirestoreProvider(
    String collectionName,
  ) : this._internal(
          (ref) => firestore(
            ref as FirestoreRef,
            collectionName,
          ),
          from: firestoreProvider,
          name: r'firestoreProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$firestoreHash,
          dependencies: FirestoreFamily._dependencies,
          allTransitiveDependencies: FirestoreFamily._allTransitiveDependencies,
          collectionName: collectionName,
        );

  FirestoreProvider._internal(
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
    FutureOr<void> Function(FirestoreRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FirestoreProvider._internal(
        (ref) => create(ref as FirestoreRef),
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _FirestoreProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FirestoreProvider && other.collectionName == collectionName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, collectionName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FirestoreRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `collectionName` of this provider.
  String get collectionName;
}

class _FirestoreProviderElement extends AutoDisposeFutureProviderElement<void>
    with FirestoreRef {
  _FirestoreProviderElement(super.provider);

  @override
  String get collectionName => (origin as FirestoreProvider).collectionName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
