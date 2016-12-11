package org.DAGD.Arcade {
	import flash.events.MouseEvent;
	import flash.system.Capabilities;



	public class MainView extends View {

		private var targetY: Number = 0;
		public var selectedY: Number = 0;
		private var thumbHeight: Number = ProjectView.IMG_CONTAINER_HEIGHT;


		//var screenWidth: Number = Capabilities.screenResolutionX;
		var screenHeight: Number = Capabilities.screenResolutionY;

		//private var heightOfContent:int = this.height;
		public function MainView() {

		}
		public override function update(): void {
			y += (targetY - y) * .1;

		}
		public override function scroll(amount: Number): void {

			// if content is less than container, no scrolling:
			if (this.height < h) {
				targetY = 0;
				return;
			}

			// "scroll" thhe targetY value:
			targetY += amount;

			// clamp max end:
			if (targetY > 0) targetY = 0;

			// clamp min end:
			var min: int = this.height - h; // heightOfContent - heightOfContainer
			if (targetY < -min) targetY = -min;

		}
		public function scrollToView(view:View):void {
			var yMin:Number = view.y;
			var yMax:Number = view.y + view.height;
			
			if(yMin + y < 0) targetY = -yMin;
			if(yMax + y > h) targetY = h - yMax;
			
		}
	}
}