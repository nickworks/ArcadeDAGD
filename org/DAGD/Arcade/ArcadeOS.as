package org.DAGD.Arcade {
	
	import flash.display.MovieClip;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.xml.XMLDocument;
	import flash.filesystem.File;
	
	
	public class ArcadeOS extends MovieClip {
		
		
		public function ArcadeOS() {
			var request:URLRequest = new URLRequest("./content/content.xml");
			var loader:URLLoader = new URLLoader(request);
			loader.addEventListener(Event.COMPLETE, doneLoading);
			
			var file:File;
			file = File.applicationDirectory.resolvePath("./content/procexp.bat");
			//FIXME: launch the bat file... needs more research?
			//fixed?
		}
		
		private function doneLoading(e:Event):void {
			var data:String = (e.target as URLLoader).data;
			var xml:XML = new XML(data);
			
			var i:int = 0;
			for each(var media:XML in xml.media){
				var bttn:MovieClip = new MovieClip();
				if(media.tags == "blue"){
					bttn.graphics.beginFill(0xFF0000);
				}else{
					bttn.graphics.beginFill(0x0);
				}
				bttn.graphics.drawCircle(0, 0, 20);
				bttn.x = 100;
				bttn.y = 100 + 50 * i;
				addChild(bttn);
				trace(media.tags);
				i++;
			}
			
		}
	}
	
}
