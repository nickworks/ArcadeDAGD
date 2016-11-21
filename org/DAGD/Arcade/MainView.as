package org.DAGD.Arcade {
	import flash.events.MouseEvent;
	
	public class MainView extends View {
	
		private var targetY:Number = 0;
		
		public function MainView() {
			
		}
		public override function update():void {
			y += (targetY - y) * .5;
		}
		public override function scroll(amount:Number):void {
			// find height of content
			var heightOfContent:int = this.height;
			
			// if content is less than container, no scrolling:
			if(heightOfContent < h){
				targetY = 0;
				return;
			}
			
			// "scroll" thhe targetY value:
			targetY += amount;
			
			// clamp max end:
			if(targetY > 0) targetY = 0;
			
			// clamp min end:
			var min:int = heightOfContent - h; // heightOfContent - heightOfContainer
			if(targetY < -min) targetY = -min;

		}
	}
	
}
