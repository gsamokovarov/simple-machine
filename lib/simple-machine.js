(function(root) {
  return root.SimpleMachine = (function() {
    function SimpleMachine(state, transitions, callbacks) {
      this.state = state;
      this.transitions = transitions != null ? transitions : {};
      this.callbacks = callbacks != null ? callbacks : {};
    }

    SimpleMachine.prototype.on = function(event, callback, context) {
      if (context != null) {
        callback = (function() {
          return callback.call(context);
        });
      }
      this.callbacks[event] = [callback].concat(this.callbacks[event]);
      return this;
    };

    SimpleMachine.prototype.trigger = function(event) {
      var callback, previous, _i, _len, _ref, _ref1, _ref2;

      if ((((_ref = this.transitions[event]) != null ? _ref[this.state] : void 0) != null) && event !== 'all') {
        _ref1 = [this.state, this.transitions[event][this.state]], previous = _ref1[0], this.state = _ref1[1];
        _ref2 = [this.callbacks.all].concat(this.callbacks[this.state]);
        for (_i = 0, _len = _ref2.length; _i < _len; _i++) {
          callback = _ref2[_i];
          if (typeof callback === "function") {
            callback(previous);
          }
        }
        return true;
      } else {
        return false;
      }
    };

    return SimpleMachine;

  })();
})(typeof 'exports' === 'undefined' ? window : exports);
