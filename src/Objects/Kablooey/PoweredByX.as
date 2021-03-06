//------------------------------------------------------------------------------------------
// <$begin$/>
// <$end$/>
//------------------------------------------------------------------------------------------
package Objects.Kablooey {
	
	import Assets.*;
	 
	import GX.Mickey.*;
		
	import X.*;
	import X.Geom.*;
	import X.Task.*;
	import X.World.*;
	import X.World.Collision.*;
	import X.World.Logic.*;
	import X.World.Sprite.*;
	
	import flash.geom.*;
	import flash.text.*;
	import flash.utils.*;
		
//------------------------------------------------------------------------------------------
	public class PoweredByX extends XLogicObject {
		public var m_sprite:XBitmap;
		public var x_sprite:XDepthSprite;
		
		public var script:XTask;
	
//------------------------------------------------------------------------------------------
		public function PoweredByX () {
		}
	
//------------------------------------------------------------------------------------------
		public override function setup (__xxx:XWorld, args:Array):void {
			super.setup (__xxx, args);
			
			createSprites ();
			
			script = addEmptyTask ();
		}

//------------------------------------------------------------------------------------------
		public override function setupX ():void {
			super.setupX ();
		}

//------------------------------------------------------------------------------------------
// create sprites
//------------------------------------------------------------------------------------------
		public override function createSprites ():void {
			m_sprite = createXBitmap ("PoweredByKablooey:PoweredByKablooey");
			x_sprite = addSpriteAt (m_sprite, m_sprite.dx, m_sprite.dy);	

			show ();
		}
		
//------------------------------------------------------------------------------------------
	}

//------------------------------------------------------------------------------------------
}