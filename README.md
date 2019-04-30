# Stamp rules for Bazel

## Setup

```py
http_archive(
    name = "ecosia_rules_stamp",
    url = "https://github.com/ecosia/rules_stamp/archive/48d5ef2bc0d93bd65fddddbe02f3ae410e25169d.tar.gz",
    strip_prefix = "rules_stamp-48d5ef2bc0d93bd65fddddbe02f3ae410e25169d",
    sha256 = "36d7ea381bfb2520f9353299b162434b25c77365d3c9e9459195c536da5e837d",
)
```

## Rules

### stamp

Extracts the stamp values out based on the specified keys and outputs them into a file for format `STAMP_<key>`. So one can depend on it in another rule or binary and get the stamping value easier, e.g. by just using `cat`.

`stamp(name, stamp_keys)`