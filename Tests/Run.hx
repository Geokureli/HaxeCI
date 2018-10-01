import Sys.*;
import sys.FileSystem.*;
import sys.io.File.*;
import haxe.*;
import haxe.io.*;

@:enum
abstract ExitCode(Int) from Int to Int
{
	var SUCCESS = 0;
	var FAILURE = 1;
}

class Run
{
	static function main():Void
	{
		trace("Hello world! 2");
		
		#if flash
		openFlRun(["test", "project.xml", "flash", "-debug", "-Dfdb"]);
		openFlRun(["test", "project.xml", "flash", "-Dfdb"]);
		#else
		openFlRun(["test", "project.xml", "html5", "-debug", "-Dwebgl"]);
		openFlRun(["test", "project.xml", "html5", "-Dwebgl"]);
		#end
		
		#if flash
		flash.system.System.exit(0);
		#end
	}
	
	static function runCommand(cmd:String, args:Array<String>):ExitCode
	{
		println(cmd + " " + args.join(" "));
		return command(cmd, args);
	}
	
	static function openFlRun(args:Array<String>):ExitCode
	{
		return runCommand("haxelib", ["run", "openfl"].concat(args));
	}
}