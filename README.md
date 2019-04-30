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

`stamp(name, stamp_keys)`