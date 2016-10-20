package org.DAGD.Arcade {
	import flash.display.MovieClip;
	import flash.net.URLRequest;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	public class Media extends MovieClip {
		
		public static const BX:int = 460;
		public static const BY:int = 215;
		public static const MARG:int = 20;
		
		private var title:String;
		private var desc:String;
		private var imgURL:String;
		
		public function Media(xml:XML) {
			title = xml.name;
			//scaleX=.25;
			//scaleY=.25;
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
