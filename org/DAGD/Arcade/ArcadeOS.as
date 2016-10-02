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
			//trace(xml.media.length());
			var mediaCount:int = xml.media.length();
			var i:int = 0;

			for (var y: int = 0; y<mediaCount/8; y++)
			{
				for (var x: int = 0; x<8; x++)
				{
					if(i<mediaCount){
					var bttn:MovieClip = new MovieClip();
					bttn.graphics.beginFill(0x0);
					bttn.graphics.drawRect(0,0,163,227);
					bttn.y = y * 350 + 50;// +200*i;
					bttn.x = x * 200 + 350;//+ 200*i;

					var txt:TextField=new TextField();
					txt.text = xml.media.name[i] + xml.media.desc[i];
					txt.textColor = 0xFF0000;
					txt.x = bttn.x;
					txt.y = bttn.y + 227;

					addChild(txt);
					addChild(bttn);
					trace(xml.media.name[i]);
					trace(i);
					i++;
					//trace(bttn.x);
					//trace(bttn.y);
					}else{
						break;
					}

				}
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