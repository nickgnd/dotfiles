// Your init script
//
// Atom will evaluate this file each time a new window is opened. It is run
// after packages are loaded/activated and after the previous editor state
// has been restored.
//
// An example hack to log to the console when each text editor is saved.
//
// atom.workspace.observeTextEditors(function(editor) {
//   return editor.onDidSave(function() {
//     return console.log(`Saved! ${editor.getPath()}`);
//   });
// });

// Save list of currently installed packages
atom.commands.add('atom-workspace', 'package-list:dump', () => {
  const exec = require('child_process').exec;
  const file = `${process.env['HOME']}/dotfiles/atom/packages.txt`;
  const cmd = `apm list --installed --bare > ${file}`;
  return exec(cmd);
});

// Install list of packages
atom.commands.add('atom-workspace', 'package-list:install', () => {
  const exec = require('child_process').exec;
  const file = `${process.env['HOME']}/dotfiles/atom/packages.txt`;
  const cmd = `apm install --packages-file ${file}`;
  return exec(cmd);
});

// Remap annoying alt space to space
atom.commands.add('atom-text-editor', 'custom:space', () => {
  const editor = atom.workspace.getActiveTextEditor();
  return editor.insertText(' ');
});
