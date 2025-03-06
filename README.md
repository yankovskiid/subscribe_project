# Cart Calculator

## Overview

This is a simple Cart Calculator app.

## Structure

- `bin/`: Contains executable scripts.
- `lib/`: Contains the main application code.
- `config/`: Contains configuration files.
- `spec/` or `test/`: Contains test files.

## Installation

To install the necessary dependencies, run the following command in your terminal:

```
bundle install
```

## Usage

To run the Cart Calculator script:

```sh
./bin/cart_calculator.rb
```

### Example

Input:
```
2 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85
```

Output:
```
2 book: 24.98
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 42.32
```

## Configuration

Configuration settings can be found in `config/config.yml`.

### Taxes and Import Settings

To configure taxes and import settings, add the following to your `config/config.yml`:

```yaml
  tax_rates:
    standard: 0.10
    exempt: 0.00
    import: 0.05
  exempt_tax_product_types:
    - book
    - food
    - medical
  product_types:
    food:
      - chocolate bar
      - chocolates
    medical:
      - pills
    book:
      - book
```

## Running Tests

To run the tests:

```sh
rake spec/
```

## Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue for any suggestions or improvements.

## License

This project is open source and available under the MIT License.