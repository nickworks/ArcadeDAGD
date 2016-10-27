package org.DAGD.Arcade {
	import flash.display.MovieClip;
	import flash.net.URLRequest;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.display.Sprite;
	import flash.display.Bitmap;
	
	public class MediaButton extends View {
		
		public static const WIDTH:int = 460;
		public static const HEIGHT:int = 215;
		public static const MARGIN:int = 5;
		
		private var imgMask:Sprite = new Sprite();
		
		public function MediaButton(data:MediaModel) {

			addChild(imgMask);
			imgMask.graphics.beginFill(0x0);
			imgMask.graphics.drawRect(0,0,WIDTH,HEIGHT);
			
			label.autoSize = TextFieldAutoSize.LEFT;
			label.text = data.title;
			loadImage(data.imgURL);
		}
		private function loadImage(imgURL):void {
			var request:URLRequest = new URLRequest(imgURL);
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, handleLoaded);
			loader.load(request);
		}
		private function handleLoaded(e:Event):void {
			e.target.removeEventListener(Event.COMPLETE, handleLoaded);
			var img:Bitmap = e.target.content;
			img.mask = imgMask;
			addChildAt(img, 0);
		}
		public override function dispose():void {
			// do cleanup here
		}
	}
}
