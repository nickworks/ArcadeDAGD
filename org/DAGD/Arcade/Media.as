package org.DAGD.Arcade {
	import flash.display.MovieClip;
	import flash.net.URLRequest;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	public class Media extends MovieClip {
		
		const BX:int = 300;
		const BY:int = 150;
		const MARG:int = 25;		
		
		var title:String;
		var desc:String;
		var imgURL:String;
		
		public function Media(xml:XML) {
			title = xml.name;
			desc = xml.desc;
			imgURL = File.applicationDirectory.resolvePath(xml.thumb).nativePath;
			
			label.autoSize = TextFieldAutoSize.LEFT;
			label.text = desc;
			loadImage();
		}
		private function loadImage():void {
			var request:URLRequest = new URLRequest(imgURL);
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, handleLoaded);
			loader.load(request);
		}
		private function handleLoaded(e:Event):void {
			e.target.removeEventListener(Event.COMPLETE, handleLoaded);
			addChild(e.target.content);
		}

	}
	
}
