# mitamae-plugin-resource-git_clone
[MItamae](https://github.com/itamae-kitchen/mitamae) resources plugin to clone git repository if it does not exist

## Installation
```sh
$ mkdir plugins
$ git submodule add https://github.com/nakahiro386/mitamae-plugin-resource-git_clone.git plugins/mitamae-plugin-resource-git_clone
```

## Definition

### Actions

- clone
- delete

### Attributes

| Name | Value | Default | Required |
| --- | --- | --- | --- |
| `action` | one of Symbol | `:clone` | yes |
| `destination` | String | (name of resource) | yes |
| `repository` | String | (no default) | yes |
| `revision` | String | (no default) | no |
| `recursive` | one of TrueClass, FalseClass | true | no |
| `depth` | Integer | (no default) | no |

## Usage
```ruby
git_clone "/path/to/clone/directory/repository" do
  repository "https://github.com/your/repository.git"
end
```

## License

MIT
