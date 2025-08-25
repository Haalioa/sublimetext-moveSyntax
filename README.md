# Move — Sublime Text Syntax
A Sublime Text syntax highlighter for the **Move** language (Aptos/Sui).

## Features
- **语法高亮支持**:
  - 模块和地址声明 (`address`, `module`)
  - 函数定义 (`fun`, `public`, `entry`, `native`, `inline`)
  - 结构体和能力 (`struct`, `has copy, drop, store, key`)
  - 可见性修饰符 (`public`, `friend`, `entry`)
  - 变量声明 (`let`, `mut`, `const`)
  - 控制流 (`if`, `else`, `while`, `loop`, `return`)
  - 资源操作 (`acquires`, `borrow_global`, `move_from`, `move_to`)
  - 规范语言 (`spec`, `ensures`, `aborts_if`, `requires`)
  - 测试注解 (`#[test]`, `#[test_only]`, `#[expected_failure]`)
  - 引用和移动语义 (`&`, `&mut`, `move`, `copy`)
  
- **字面量支持**:
  - 整数后缀 (`u8`, `u16`, `u32`, `u64`, `u128`, `u256`)
  - 十六进制地址 (`0x1`, `0xABC123`)
  - 字节字符串 (`b"Hello"`)
  - 十六进制字符串 (`x"DEADBEEF"`)
  
- **作用域**: `source.move`

## 安装方法
1. 将此文件夹复制到 Sublime Text 的包目录：
   - **Mac**: `~/Library/Application Support/Sublime Text/Packages/`
   - **Windows**: `%APPDATA%\Sublime Text\Packages\`
   - **Linux**: `~/.config/sublime-text/Packages/`
   
2. 或者通过 **Preferences → Browse Packages...** 找到包目录

3. 重启 Sublime Text

4. 打开 `.move` 文件时会自动应用语法高亮，或手动选择 **View → Syntax → Move**

## 使用示例
```move
address 0x1 {
    module example::coin {
        use std::vector;
        friend 0x1::friend_mod;
        
        public struct Coin has copy, drop, store, key { 
            value: u64 
        }
        
        const MAX: u64 = 1_000u64;
        
        #[test_only]
        public entry fun mint(account: &signer, amount: u64): Coin 
        acquires Coin {
            let mut supply: u64 = 0;
            let _name = b"COIN";
            let _hex = x"DEADBEEF";
            
            if (amount > 0) { 
                return Coin { value: amount }; 
            } else { 
                return Coin { value: 0 }; 
            }
        }
        
        spec {
            ensures true;
            aborts_if false;
        }
    }
}
```

