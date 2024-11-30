import 'dart:async';
import 'package:flutter/widgets.dart';

/// A memory-only database implementation inspired by GetStorage
class MemoryDatabase {
  factory MemoryDatabase([String container = 'MemoryDatabase']) {
    if (_instances.containsKey(container)) {
      return _instances[container]!;
    } else {
      final instance = MemoryDatabase._internal(container);
      _instances[container] = instance;
      return instance;
    }
  }

  MemoryDatabase._internal(this._container);

  static final Map<String, MemoryDatabase> _instances = {};
  final String _container;
  final Map<String, dynamic> _storage = {};
  final Map<String, List<ValueSetter>> _listeners = {};

  /// Read a value from storage
  T? read<T>(String key) {
    return _storage[key] as T?;
  }

  /// Write a value to storage and notify listeners
  void write(String key, dynamic value) {
    _storage[key] = value;
    
    // Notify all listeners for this key
    if (_listeners.containsKey(key)) {
      for (var listener in _listeners[key]!) {
        listener(value);
      }
    }
  }

  /// Listen to changes on a specific key using a callback
  VoidCallback listenKey(String key, ValueSetter callback) {
    if (!_listeners.containsKey(key)) {
      _listeners[key] = [];
    }
    _listeners[key]!.add(callback);

    // Return function to remove listener
    return () {
      _listeners[key]?.remove(callback);
      if (_listeners[key]?.isEmpty ?? false) {
        _listeners.remove(key);
      }
    };
  }

  /// Remove all data and listeners
  void dispose() {
    _storage.clear();
    _listeners.clear();
  }
}
