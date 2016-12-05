﻿package org.DAGD.Arcade {
	import flash.events.MouseEvent;
	
	public class MainView extends View {
	
		private var targetY:Number = 0;
		public var selectedY:Number=0;
		private var contentH:int;
		//private var heightOfContent:int = this.height;
		public function MainView() {
			
		}
		public override function update():void {
			var heightOfContent:int = this.height;
			trace(heightOfContent);
			trace(selectedY);
			contentH=heightOfContent;
			//if(selectedY>(.67*contentH))targetY=-selectedY;
			if(selectedY>(.5*heightOfContent))targetY=-selectedY/3;
			if(selectedY<(.5*heightOfContent))targetY=0;
			y += (targetY - y) * .5;
			
		}
		public override function scroll(amount:Number):void {
			// find height of content
			
			//contentH=heightOfContent;
			//trace(heightOfContent);//1369
			//trace(selectedY);
			// if content is less than container, no scrolling:
			if(contentH < h){
				targetY = 0;
				return;
			}
			
			// "scroll" thhe targetY value:
			targetY += amount;
			
			// clamp max end:
			if(targetY > 0) targetY = 0;
			
			// clamp min end:
			var min:int = contentH - h; // heightOfContent - heightOfContainer
			if(targetY < -min) targetY = -min;

		}
	}
	
}
