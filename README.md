# Verilog Implementation of AES Algorithm

Welcome to the Verilog Implementation of the Advanced Encryption Standard (AES) Algorithm! This repository provides a hardware description of the AES encryption and decryption process for three key sizes: 128 bits, 192 bits, and 256 bits.

## Overview

AES is a widely used symmetric encryption algorithm, and this Verilog implementation allows you to integrate AES into your hardware projects seamlessly. Whether you're working on FPGA-based systems or custom ASIC designs, this implementation provides efficient and customizable solutions for securing your data.

## Features

- **Versatility**: Supports key sizes of 128, 192, and 256 bits, allowing you to choose the level of security that best suits your application.
- **Modularity**: Well-organized Verilog modules make it easy to integrate AES into existing projects or expand its functionality effortlessly.
- **Performance**: Optimized for hardware implementation, ensuring fast and reliable encryption and decryption processes.
- **Configurability**: Customize the implementation to meet your specific requirements, making it suitable for a wide range of applications.

## Getting Started

1. Clone the repository to your local machine.
2. Open the Verilog files corresponding to your desired key size (128, 192, or 256 bits).
3. Integrate the modules into your Verilog project.
4. Connect input and output ports according to your system requirements.
5. Simulate and synthesize the design using your preferred tools.

## Usage

```verilog
// Example instantiation for AES with a 128-bit key
aes_128 #(16'h2b7e1516, 16'hae2d8a1, 16'hae2d8a1) my_aes (
    .clk(clk),
    .reset_n(reset_n),
    .encrypt_mode(encrypt_mode),
    .key(key),
    .data_in(data_in),
    .data_out(data_out)
);
```

Adjust the parameters as needed based on your project requirements.

## Contributions

Contributions are welcome! Whether you want to add features, improve performance, or fix bugs, feel free to submit a pull request.

## License

This AES Verilog implementation is licensed under the [MIT License](LICENSE).

Feel free to explore, experiment, and secure your data with the power of AES in your hardware projects!
