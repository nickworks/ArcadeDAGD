package org.DAGD.Arcade
{

	import flash.display.MovieClip;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.xml.XMLDocument;
	import flash.filesystem.File;
	import flash.geom.*;
	import flash.text.TextField;
	import flash.display.Loader;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;

	public class ArcadeOS extends MovieClip
	{

		const DATA_PATH:String = "./content/content.xml";
		var data:XML;
		var collection:Array = new Array();
		
		public function ArcadeOS()
		{
			screenSetup();
			
			loadData();	
		}
		private function loadData():void {
			var request:URLRequest = new URLRequest(DATA_PATH);
			var loader:URLLoader = new URLLoader(request);
			loader.addEventListener(Event.COMPLETE, doneLoadingData);
		}
		private function doneLoadingData(e:Event):void
		{
			var data:String = (e.target as URLLoader).data;
			var xml:XML = new XML(data);
				
			for(var i:int = 0; i < xml.media.length(); i++){	
				var media:Media = new Media(xml.media[i]);
				collection.push(media);
				layoutSetup(media, i);
				addChild(media);
			}	
		}
		private function layoutSetup(media:Media, i:int):void {
			var cols:Number = Math.floor(stage.fullScreenWidth/media.BX);
			var spaceX:int = media.BX+media.MARG;
			var spaceY:int = media.BY+media.MARG;
			var gridX:int = i%cols;
			var gridY:int = Math.floor(i/cols);
			
			media.x = gridX*spaceX;
			media.y = gridY*spaceY;
			//trace(gridX);
			//trace(gridY);
			//trace(media.BX);
			//trace(cols);
		}
		private function screenSetup():void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.nativeWindow.bounds = new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight);
		}
		private function launchBat():void {
			var file:File = File.applicationDirectory.resolvePath("./content/procexp.bat");
			//FIXME: launch the bat file... needs more research?
			//fixed?
		}
	}

}