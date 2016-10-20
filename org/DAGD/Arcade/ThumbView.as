package org.DAGD.Arcade {

	public class ThumbView extends MainView {

		public function ThumbView() {
			// constructor code
		}
		override public function layout(w: int, h: int): void {

			for (var i = 0; i < ArcadeOS.collection.length; i++) {
				var media: Media = ArcadeOS.collection[i];
				var cols: Number = Math.floor(w / Media.BX);
				var spaceX: int = Media.BX + Media.MARG;
				var spaceY: int = Media.BY + Media.MARG;
				var gridX: int = i % cols;
				var gridY: int = Math.floor(i / cols);

				media.x = gridX * spaceX;
				media.y = gridY * spaceY;

			}
		}

	}

}