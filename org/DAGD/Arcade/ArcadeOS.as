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
	import flash.desktop.NativeProcess;
	import flash.desktop.NativeProcessStartupInfo;
	import flash.system.fscommand;

	public class ArcadeOS extends MovieClip
	{

		private static const DATA_PATH:String = "./content/content.xml";
		private var data:XML;
		public static var collection:Array = new Array();
		
		private var sideView:SideView;
		private var mainView:MainView;
		
		private var windowH:Number = stage.fullScreenHeight;
		private var windowW:Number = stage.fullScreenWidth;
		
		public function ArcadeOS()
		{
			
			sideView = new SideView();
			mainView = new ThumbView();
			
			addChild(sideView);
			addChild(mainView);
			
			//launchExe("content/procexp.exe", "/t");
			screenSetup();
			loadData();
			
			//thumbView = new ThumbView();
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
				collection.push(new MediaModel(xml.media[i]));
			}
			
			
			layout(true);
		}

		private function screenSetup():void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.nativeWindow.bounds = new Rectangle(0, 0, windowW, windowH);
		}
		
		private function layout(dataUpdated:Boolean):void {
			var w:int = stage.stageWidth;
			var h:int = stage.stageHeight;
			
			if(dataUpdated){
				mainView.dataUpdated();
				sideView.dataUpdated();
			}
			
			var sideViewWidth:int = 300;
			
			mainView.layout(w - sideViewWidth, h);
			mainView.x = sideViewWidth;
			
			sideView.layout(sideViewWidth, h);
			
		}
		private static function launchExe(path:String, args:String = ""):void {
			var appInfo:NativeProcessStartupInfo = new NativeProcessStartupInfo();
			appInfo.executable = File.applicationDirectory.resolvePath(path);
			if(args != "") appInfo.arguments.push(args);
			
			var app:NativeProcess = new NativeProcess();
			app.start(appInfo);
		}
	}
}