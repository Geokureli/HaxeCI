class Run {
	static function main():Void {
		trace("Hello world! 1");

		#if flash
		flash.system.System.exit(0);
		#end
	}
}