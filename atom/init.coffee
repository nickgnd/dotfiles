# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"

# Save list of currently installed packages
atom.commands.add 'atom-workspace', 'package-list:dump', ->
  exec = require('child_process').exec
  file = "#{process.env['DOTS']}/atom/packages.txt"
  cmd  = "apm list --installed --bare > #{file}"
  exec cmd

# Install list of packages
atom.commands.add 'atom-workspace', 'package-list:install', ->
  exec = require('child_process').exec
  file = "#{process.env['DOTS']}/atom/packages.txt"
  cmd  = "apm install --packages-file #{file}"
  exec cmd

# Remap annoying alt space to space
atom.commands.add 'atom-text-editor', 'custom:space', () ->
  editor = atom.workspace.getActiveTextEditor()
  editor.insertText(' ')
