@if(0)==(0) echo off
cscript.exe //nologo //E:JScript "%~f0" %*
goto :EOF
@end

// Cite.
// [起動オプション付きショートカットを作成するバッチファイル](https://qiita.com/geokih/items/326085b00e806a27c6b8)
// [ショートカットを作成するバッチファイル(ファイル単体, JScript混在)](https://qiita.com/y-takano/items/b94312abc17159dce8be)

// メイン処理
function main() {
    var shortcut = null;
    try {
        // ショートカットを作成する
        shortcut = new ShortcutCreater();
        shortcut.create();

        // 作成したショートカットをコンソールに出力する
        Console.println("The shortcut has successfully created.");
        Console.println(shortcut);

    } catch (e) {

        // 例外原因をコンソールに出力する
        Console.println("[error occured]: " + e.description);
        Console.println("usage: shortcut.bat [filepath] [linkpath]");

        // 異常終了でコマンドを返す
        Console.back(e.number);

    } finally {

        // WSHオブジェクトを片付ける
        if (shortcut !== null)
            shortcut.cleanup();
    }

    // 正常終了でコマンドを返す
    Console.back(0);
}

// コンソール汎用クラス
var Console = ((function() {
    var constructor = function() {}
    constructor.println = echoConsole;
    constructor.back = exitScript;
    return constructor;
})())

// ショートカットを作るクラス
var ShortcutCreater = function() {
    var args = WScript.Arguments;
    validate(args);
    this.wshObj = openWsh();
    this.file = args(0);
    this.link = args(1);
    this.opt  = args(2);
    this.wd   = args(3);
    this.create = createShortcut;
    this.cleanup = closeWsh;
    this.toString = createrToString;
}

// ----- 以降関数群 -------

function validate(args) {
    if (args == null) {
        throw new Error(1, "args=null or undefined");
    }
    if (args.length !== 4) {
        var str = "args = ";
        for (i=0; i < args.length; i++)
            str += "[" + i + "]:" + args(i) + " ";
        throw new Error(2, str);
    }
}

function createShortcut() {
    var lnkFile = this.wshObj.CreateShortcut(this.file);
    lnkFile.TargetPath = this.link;
    lnkFile.Arguments  = this.opt;
    lnkFile.WorkingDirectory = this.wd;
    // lnkFile.IconLocation = this.ico;
    // lnkFile.Hotkey = "ALT+CTRL+F";
    lnkFile.Save();
}

function createrToString() {
    return "file=\"" + this.file + "\", linkTo=\"" + this.link + "\", option=\"" + this.opt + "\"";
}

function openWsh() {
    return WScript.CreateObject("WScript.Shell");
}

function closeWsh() {
    this.wshObj = null;
}

function echoConsole(msg) {
    WScript.echo(msg);
}

function exitScript(errNum) {
    WScript.Quit(errNum);
}

// メイン処理呼び出し
main();