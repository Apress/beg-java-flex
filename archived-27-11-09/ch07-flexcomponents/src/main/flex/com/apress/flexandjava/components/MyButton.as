package com.apress.flexandjava.components
{
	import flash.events.Event;
	import flash.events.MouseEvent;

	import mx.containers.Panel;
	import mx.containers.Tile;
	import mx.controls.Button;
	import mx.controls.TextInput;

	[Event(name="displayChange", type="flash.events.Event")]

	public class MyButton extends Panel
	{

		public function MyButton()
		{
			super();
			setStyle ("paddingLeft", 10);
            setStyle ("paddingRight", 10);
            setStyle ("paddingTop", 10);
            setStyle ("paddingBottom", 10);
		}


		private var tile : Tile;

		public var textInput : TextInput;

		private var a : Number;

		private var b : Number;

		private var operator : String;

		private const CALCULATOR_WIDTH : uint = 230;

		private const CALCULATOR_HEIGHT : uint = 230;

		override protected function createChildren():void{
			super.createChildren();

			textInput = new TextInput();
            textInput.percentWidth = 100;
            //textInput.addEventListener(Event., textInputChangeHandler)
            addChild(textInput);


			tile = new Tile();
            addChild (tile);

            for (var i:uint = 0; i < 10; i++) {
                var button:Button = new Button();
                button.label = i.toString();
                button.addEventListener(MouseEvent.CLICK, buttonClickHandler);
                tile.addChild (button);
            }

            var mathOperatorsList : Array = ["+","-","*","/"];

            for (var j:uint = 0; j < mathOperatorsList.length; j++){
            	 var operatorButton : Button = new Button();
	            operatorButton.label = mathOperatorsList[j];
	            operatorButton.addEventListener(MouseEvent.CLICK, operatorButtonClickHandler);
	            tile.addChild(operatorButton);
            }

            var calculateButton : Button = new Button();
            calculateButton.label = '=';
            calculateButton.addEventListener(MouseEvent.CLICK, calculateButtonClickHandler);
            tile.addChild(calculateButton);
		}

		private function buttonClickHandler(event : MouseEvent):void{
			textInput.text += Button(event.currentTarget).label;
			dispatchEvent(new Event("displayChange"));

		}

		private function operatorButtonClickHandler(event : MouseEvent):void{
			//a = parseInt(textInput.text);
			//operator = Button(event.currentTarget).label;
		}

		private function calculateButtonClickHandler(event : MouseEvent):void{
			//textInput.text
		}

		private function textInputChangeHandler(event : Event):void{
			dispatchEvent(event);
		}

        override protected function measure():void {
            super.measure();
            measuredWidth = CALCULATOR_WIDTH;
            measuredHeight = CALCULATOR_HEIGHT;
        }

        override protected function updateDisplayList(unscaledWidth:Number,
                unscaledHeight:Number):void {
            super.updateDisplayList(CALCULATOR_WIDTH, CALCULATOR_HEIGHT);
            this.setActualSize(CALCULATOR_WIDTH,CALCULATOR_HEIGHT);
        }

	}
}