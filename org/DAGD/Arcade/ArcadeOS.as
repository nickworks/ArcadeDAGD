﻿package org.DAGD.Arcade
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
				addChild(media);
			}	
		}
		private function doLayout():void {
			/*
			for (var y: int = 0; y<mediaCount/8; y++)
			{
				for (var x: int = 0; x<8; x++)
				{
					if(i<mediaCount){
					var bttn:MovieClip = new MovieClip();
					trace(xml.media.thumb);
					
					//var jpgURL1:URLRequest = new URLRequest(xml.media.thumb);
					var picUrlRequest:URLRequest = new URLRequest(xml.media.thumb);
					var picLoader:Loader = new Loader();
					picLoader.load(picUrlRequest);
					addChild(picLoader);
					
					bttn.graphics.beginFill(0x0);
					bttn.graphics.drawRect(0,0,163,227);
					bttn.y = y * 350 + 50;
					bttn.x = x * 200 + 350;

					var txt:TextField=new TextField();
					txt.text = xml.media.name[i] + xml.media.desc[i];

					txt.textColor = 0xFF0000;
					txt.x = bttn.x;
					txt.y = bttn.y + 227;

					addChild(txt);
					//addChild(bttn);
					trace(xml.media.name[i]);
					i++;
					//trace(bttn.x);
					//trace(bttn.y);
					}else{
						break;
					}

				}
			}
			*/
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