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
		public static const MARGIN:int = 10;
		
		private var imgMask:Sprite = new Sprite();
		
		/**
		* MediaButton() loads the information needed to display
		* the media and other important information on the screen
		*
		* Then runs the loadImage function with the URL data
		*
		* @param data:MediaModel called in ThumbView to pull data from MediaModel
		*/
		public function MediaButton(data:MediaModel) {
			addChild(imgMask);
			imgMask.graphics.beginFill(0x0);
			imgMask.graphics.drawRect(0,0,WIDTH,HEIGHT);
			
			label.autoSize = TextFieldAutoSize.LEFT;
			label.text = data.title;
			loadImage(data.imgURL);
		}
		/**
		* loadImage() uses the information gathered from MediaButton
		* and loads the file URL
		*
		* Then it runs the following function, handleLoaded, after 
		* the event is completed
		*
		* @param imgURL takes the url data from the MediaButton function and uses it for the URLRequest
		*/
		private function loadImage(imgURL):void {
			var request:URLRequest = new URLRequest(imgURL);
			var loader:Loader = new Loader();
			
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, handleLoaded);
			loader.load(request);
		}
		/**
		* handleLoaded() takes the loaded url from the loadImage
		* function and uses the url's information and turns it 
		* into a bitmap to be displayed
		*
		* Uses the media's iwdth and height to create a mask
		* insuring each media is displayed at the same size
		*
		* @param e:Event an event listener waiting for the data to finish loading before running handleLoaded()
		*/
		private function handleLoaded(e:Event):void {
			e.target.removeEventListener(Event.COMPLETE, handleLoaded);
			var img:Bitmap = e.target.content;
			img.mask = imgMask;
			addChildAt(img, 0);
		}
		/**
		* This function disposes of all MediaButton information
		*
		*/
		public override function dispose():void {
			// do cleanup here
		}
	}
}
