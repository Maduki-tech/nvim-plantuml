# PlantUML Neovim Plugin

A Neovim plugin for creating, rendering, and previewing UML diagrams directly from `.puml` files. This plugin integrates with [PlantUML](https://plantuml.com/) and provides an efficient workflow for working with UML diagrams.

---

## Features
- **Seamless UML Rendering**: Automatically render UML diagrams from `.puml` files.
- **Auto-Refresh**: Render diagrams on file save (optional).
- **Cross-Platform Compatibility**: Works on macOS, Linux, and Windows (planned future enhancements for non-macOS systems).
- **Simple Workflow**: Write UML in `.puml` files and preview the rendered diagrams with a single command.

---

## Installation

### Prerequisites
1. **PlantUML**:
   - Install PlantUML:
     ```bash
     brew install plantuml # macOS
     sudo apt install plantuml # Ubuntu
     ```
   - Ensure `plantuml` is available in your `PATH`.

2. **Java**:
   - Install Java (required by PlantUML):
     ```bash
     brew install openjdk # macOS
     sudo apt install default-jre # Ubuntu
     ```

3. **Neovim**:
   - Requires Neovim 0.8+ with Lua support.

### Plugin Installation

Using [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use {
    'Maduki-tech/nvim-plantuml',
    config = function()
        require('plantuml').setup({
            output_dir = '/tmp',
            viewer = 'open',
            auto_refresh = true,
        })
    end
}
```

---

## Configuration

The plugin can be configured by calling the `setup` function with the following options:

```lua
require('plantuml').setup({
    output_dir = '/tmp',                   -- Directory to store rendered diagrams
    viewer = 'open',                       -- Command to open rendered diagrams (e.g., `open` for macOS)
    auto_refresh = true,                   -- Enable or disable auto-refresh on save
})
```

### Default Configuration
If no configuration is provided, the following defaults are used:

```lua
{
    output_dir = '/tmp',
    viewer = 'open',
    auto_refresh = false,
}
```

---

## Usage

### Commands

| Command             | Description                                      |
|---------------------|--------------------------------------------------|
| `:PlantUMLPreview`  | Render and preview the current `.puml` file.     |

### Workflow
1. Open or create a `.puml` file in Neovim:
   ```text
   @startuml
   Alice -> Bob: Hello Bob
   Bob --> Alice: Hi Alice
   @enduml
   ```

2. Run the `:PlantUMLPreview` command to render and preview the diagram.
3. Save the file (`:w`) to trigger auto-refresh (if enabled).

---

## Roadmap

### Short-Term Goals
- [x] Basic rendering of `.puml` files using PlantUML.
- [x] Auto-refresh support.
- [x] Cross-platform compatibility for macOS.
- [ ] Improve error handling and diagnostics.

### Medium-Term Goals
- [ ] Add support for opening rendered diagrams in platform-specific viewers (e.g., Windows Photo Viewer).
- [ ] Allow rendering to multiple formats (SVG, PDF).
- [ ] Add inline ASCII diagram previews in Neovim.

### Long-Term Goals
- [ ] Interactive UML editing directly within Neovim.
- [ ] Real-time rendering as you type.
- [ ] Syntax highlighting for `.puml` files.
- [ ] Integration with external diagram storage services.

---

## Troubleshooting

### PlantUML Not Found
Ensure that `plantuml` is installed and available in your `PATH`. Test it by running:
```bash
plantuml -version
```

### Java Not Installed
Install Java and ensure it is available in your `PATH`. Test it by running:
```bash
java -version
```

### Diagrams Not Opening
Ensure the configured `viewer` command works. Test it manually:
```bash
open /path/to/diagram.png # macOS
```

---

## Contributing
Contributions are welcome! If you encounter bugs or have feature suggestions, feel free to open an issue or submit a pull request.

---

## License
This plugin is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Acknowledgments
- [PlantUML](https://plantuml.com/)
- [Neovim](https://neovim.io/)


