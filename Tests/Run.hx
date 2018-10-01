class Run {
	static function main():Void {
		trace("Hello world! 2");

		#if flash
		flash.system.System.exit(0);
		#end
	}
}