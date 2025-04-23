

  
  String formatSize(int bytes) {
    if (bytes >= 1024 * 1024 * 1024) {
      return "${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} جيجابايت";
    } else if (bytes >= 1024 * 1024) {
      return "${(bytes / (1024 * 1024)).toStringAsFixed(1)} ميجابايت";
    } else if (bytes >= 1024) {
      return "${(bytes / 1024).toStringAsFixed(1)} كيلوبايت";
    } else {
      return "$bytes بايت";
    }
  }
