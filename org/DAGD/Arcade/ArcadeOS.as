﻿package org.DAGD.Arcade
{

	import flash.display.MovieClip;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.xml.XMLDocument;
	import flash.filesystem.File;
	import flash.geom.*;



	public class ArcadeOS extends MovieClip
	{


		public function ArcadeOS()
		{
			var request:URLRequest = new URLRequest("./content/content.xml");
			var loader:URLLoader = new URLLoader(request);
			loader.addEventListener(Event.COMPLETE, doneLoading);

			var file:File;
			file = File.applicationDirectory.resolvePath("./content/procexp.bat");
			//FIXME: launch the bat file... needs more research?
			//fixed?
		}

		private function doneLoading(e:Event):void
		{
			var data:String = (e.target as URLLoader).data;
			var xml:XML = new XML(data);

			//var i:int = 0;

			for each (var media:XML in xml.media)
			{
				for (var y: int = 0; y<4; y++)
				{
					for (var x: int = 0; x<6; x++)
					{
						var bttn:MovieClip = new MovieClip();
						bttn.graphics.beginFill(0x0);
						bttn.graphics.drawRect(0,0,100,150);
						bttn.y = y * 200 + 20;
						bttn.x = x * 125 + 20;
						addChild(bttn);
					}
				}

				trace(bttn.x);
				trace(bttn.y);
				//i++;
			}

		}
		private function screenSetup():void
		{
			//var fullScreenW: Number = stage.fullScreenWidth;
			//var fullscreenH:Number = stage.fullScreenHeight;
			//stage.stageWidth = windowWidth;
			//stage.stageHeight = windowHeight;
			//var windowWidth = stage.fullScreenWidth;
			//var windowHeight = stage.fullScreenHeight;
		}
	}

}