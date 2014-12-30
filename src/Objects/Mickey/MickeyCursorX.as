//------------------------------------------------------------------------------------------
// <$begin$/>
// <$end$/>
//------------------------------------------------------------------------------------------
package Objects.Mickey {
	
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
	public class MickeyCursorX extends _MickeyCursorX {
		public var m_spriteCircle:XMovieClip;
		public var x_spriteCircle:XDepthSprite;
		public var m_spriteArrow:XMovieClip;
		public var x_spriteArrow:XDepthSprite;
		public var m_stagePoint:XPoint;
		public var m_worldPoint:XPoint;
		public var m_cursorMode:Number;
		
		public const COMPASS_MODE:Number = 1;
		public const POINTER_MODE:Number = 2;
		public const WAITING_MODE:Number = 3;
		
		public var script:XTask;
	
//------------------------------------------------------------------------------------------
		public function MickeyCursorX () {
		}
	
//------------------------------------------------------------------------------------------
		public override function setup (__xxx:XWorld, args:Array):void {
			super.setup (__xxx, args);
			
			createSprites ();
			
			script = addEmptyTask ();
			
			mouseEnabled = m_spriteCircle.mouseEnabled = x_spriteCircle.mouseEnabled = false;
			
			m_stagePoint = new XPoint ();
			m_worldPoint = new XPoint ();
			
			setPointerMode ();
		}

//------------------------------------------------------------------------------------------
		public override function setupX ():void {
			super.setupX ();
		}

//------------------------------------------------------------------------------------------
// create sprites
//------------------------------------------------------------------------------------------
		public override function createSprites ():void {
			m_spriteCircle = createXMovieClip ("MickeyCursor:MickeyCursor");
			x_spriteCircle = addSpriteAt (m_spriteCircle, 0, 0);
			
			m_spriteArrow = createXMovieClip ("MickeyCursorArrow:MickeyCursorArrow");
			x_spriteArrow = addSpriteAt (m_spriteArrow, 0, 0);
			m_spriteArrow.alpha = 0.60;
			x_spriteArrow.setDepth (25000); 	
			
			show ();
		}

//------------------------------------------------------------------------------------------
		public function setPointerMode ():void {
			m_cursorMode = POINTER_MODE;
			
			m_spriteCircle.gotoAndStop (1);
			x_spriteArrow.visible2 = false;
			
			Pointer_Script ();
		}
		
//------------------------------------------------------------------------------------------
		public function setCompassMode ():void {
			m_cursorMode = COMPASS_MODE;
			
			m_spriteCircle.gotoAndStop (2);
			x_spriteArrow.visible2 = true;
			
			Compass_Script ();
		}

//------------------------------------------------------------------------------------------
		public function setWaitingMode ():void {
			m_cursorMode = WAITING_MODE;
			
			m_spriteCircle.gotoAndStop (3);
			x_spriteArrow.visible2 = true;
			
			Waiting_Script ();
		}
		
//------------------------------------------------------------------------------------------
		public function setCompassRotation (__value:Number):void {
			m_spriteArrow.rotation = __value;	
		}
		
//------------------------------------------------------------------------------------------
		public function Compass_Script ():void {
			/*
			G.app$.addMickeyWaitingListener (
				function ():void {
					Waiting_Script ();
				}
			);
			*/
			
			m_spriteCircle.gotoAndStop (2);
			
			//------------------------------------------------------------------------------------------
			script.gotoTask ([
				
			//------------------------------------------------------------------------------------------
			// control
			//------------------------------------------------------------------------------------------
			function ():void {
				
				script.addTask ([
					XTask.LABEL, "loop",
						function ():void { oAlpha = 0.80; }, XTask.WAIT, 0x0400,
						function ():void { oAlpha = 0.60; }, XTask.WAIT, 0x0300,
						function ():void { oAlpha = 0.40; }, XTask.WAIT, 0x0200,
						function ():void { oAlpha = 0.20; }, XTask.WAIT, 0x0100,
						function ():void { oAlpha = 0.40; }, XTask.WAIT, 0x0200,
						function ():void { oAlpha = 0.60; }, XTask.WAIT, 0x0300,
					
					XTask.GOTO, "loop",
					
					XTask.RETN,
				]);
				
				script.addTask ([
					XTask.LABEL, "loop",
						function ():void { m_spriteArrow.gotoAndStop (8); }, XTask.WAIT, 0x0100,
					
					XTask.GOTO, "loop",
						
					XTask.RETN,
				]);
				
				var __rotation:Number = 0;
				
				script.addTask ([
					XTask.LABEL, "loop",
						XTask.WAIT, 0x0100,
						
						function ():void {
							__rotation = (__rotation - 2.0) % 360;
							
							m_spriteCircle.rotation = __rotation;
						},
						
						function ():void {
							m_stagePoint.x = xxx.mouseX;
							m_stagePoint.y = xxx.mouseY;
							
							xxx.globalToWorld2 (
								getLayer (),
								m_stagePoint,
								m_worldPoint
							);
							
							oX = m_worldPoint.x;
							oY = m_worldPoint.y;	
						},
						
						XTask.GOTO, "loop",
					
					XTask.RETN,
				]);			
			},
				
			//------------------------------------------------------------------------------------------
			// animation
			//------------------------------------------------------------------------------------------	
			XTask.LABEL, "loop",	
				XTask.WAIT, 0x0100,	
				
				XTask.GOTO, "loop",
				
			XTask.RETN,
				
		//------------------------------------------------------------------------------------------			
		]);
	}
		
	//------------------------------------------------------------------------------------------
	public function Waiting_Script ():void {		
		G.app$.addMickeyPlayingListener (
			function ():void {
				Compass_Script ();
			}
		);
		
		m_spriteCircle.gotoAndStop (3);
		
		//------------------------------------------------------------------------------------------
		script.gotoTask ([
					
			//------------------------------------------------------------------------------------------
			// control
			//------------------------------------------------------------------------------------------
			function ():void {
						
				script.addTask ([
					XTask.LABEL, "loop",
						function ():void { oAlpha = 1.00; }, XTask.WAIT, 0x0400,
							
						XTask.GOTO, "loop",
							
						XTask.RETN,
					]);
						
				script.addTask ([
					XTask.LABEL, "loop",
						function ():void { m_spriteArrow.gotoAndStop (8); }, XTask.WAIT, 0x0100,
							
						XTask.GOTO, "loop",
							
					XTask.RETN,
				]);
						
				var __rotation:Number = 0;
						
				script.addTask ([
					XTask.LABEL, "loop",
						XTask.WAIT, 0x0100,
							
						function ():void {
							__rotation = (__rotation - 2.0) % 360;
								
							m_spriteCircle.rotation = __rotation;
						},
							
						function ():void {
							m_stagePoint.x = xxx.mouseX;
							m_stagePoint.y = xxx.mouseY;
								
							xxx.globalToWorld2 (
								getLayer (),
								m_stagePoint,
								m_worldPoint
							);
								
							oX = m_worldPoint.x;
							oY = m_worldPoint.y;	
						},
							
						XTask.GOTO, "loop",
							
					XTask.RETN,
				]);			
			},
					
			//------------------------------------------------------------------------------------------
			// animation
			//------------------------------------------------------------------------------------------	
			XTask.LABEL, "loop",	
				XTask.WAIT, 0x0100,	
					
				XTask.GOTO, "loop",
					
				XTask.RETN,
						
		//------------------------------------------------------------------------------------------			
		]);
	}
					
	//------------------------------------------------------------------------------------------
	public function Pointer_Script ():void {
			oAlpha = 1.0;
			oRotation = 0.0;
			
			script.gotoTask ([
					
				//------------------------------------------------------------------------------------------
				// control
				//------------------------------------------------------------------------------------------
				function ():void {
					script.addTask ([
						XTask.LABEL, "loop",
							XTask.WAIT, 0x0100,
							
							function ():void {
							},
							
						XTask.GOTO, "loop",
							
						XTask.RETN,
					]);	
										
					script.addTask ([
						XTask.LABEL, "loop",
							XTask.WAIT, 0x0100,
							
							function ():void {
								m_spriteCircle.rotation = 0;
							},
							
							function ():void {
								oX = xxx.mouseX;
								oY = xxx.mouseY;
								
								m_stagePoint.x = xxx.mouseX;
								m_stagePoint.y = xxx.mouseY;
								
								xxx.globalToWorld2 (
									getLayer (),
									m_stagePoint,
									m_worldPoint
								);
								
								oX = m_worldPoint.x;
								oY = m_worldPoint.y;
							},
							
							XTask.GOTO, "loop",
							
						XTask.RETN,
					]);
				},
					
				//------------------------------------------------------------------------------------------
				// animation
				//------------------------------------------------------------------------------------------	
				XTask.LABEL, "loop",	
					XTask.WAIT, 0x0100,	
					
					XTask.GOTO, "loop",
					
				XTask.RETN,
					
			//------------------------------------------------------------------------------------------			
			]);
		}
			
//------------------------------------------------------------------------------------------
	}

//------------------------------------------------------------------------------------------
}