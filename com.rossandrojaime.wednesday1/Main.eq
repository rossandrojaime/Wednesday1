


public class Main: SEScene
{
		SESprite bg;
		SESprite fg;
		SESprite text;
		bool move_left = false;
		bool move_right = true;
		bool move_down = false;
		bool move_up = true;
		int speed;
		int bounce;
		double rotation;
		String display;
		
		public void initialize(SEResourceCache rsc) {
			base.initialize(rsc);
			speed=100;
			rotation=0;
			bounce=0;
			
			bg = add_sprite_for_color(Color.instance("white"), get_scene_width(), get_scene_height());
			bg.move(0, 0);

			//fg = add_sprite_for_color(Color.instance("green"), get_scene_width()*0.1, get_scene_height()*0.1);

			rsc.prepare_image("my_image", "Barney", get_scene_width()*0.1, get_scene_height()*0.1);
			fg = add_sprite_for_image(SEImage.for_resource("my_image"));

			fg.move(100,100);

			rsc.prepare_font("myfont", "arial bold color=blue", 40);
			display = "BOUNCE = %d".printf()
				.add(Primitive.for_integer(bounce)).to_string();
			text = add_sprite_for_text(display, "myfont");
			text.move(0, get_scene_height() - text.get_height());

			
		}

		
		public void update(TimeVal now, double delta) {
			speed += 20;
			rotation += MathConstant.M_PI_4/9;
			fg.set_rotation(rotation);
			if(move_up) {
				fg.move(fg.get_x(), fg.get_y()+delta*speed);
				if(fg.get_y()+fg.get_height() > get_scene_height()){
					move_up=false;
					move_down=true;
					speed=100;
					bounce++;
				}
			display = "BOUNCE = %d".printf()
				.add(Primitive.for_integer(bounce)).to_string();
			text.set_text(display);		
			}

			if(move_down) {
				fg.move(fg.get_x(), fg.get_y()-delta*speed);
				if(fg.get_y() < 0) {
					move_up=true;
					move_down=false;
					speed=100;
					bounce++;
				}
			display = "BOUNCE = %d".printf()
				.add(Primitive.for_integer(bounce)).to_string();
			text.set_text(display);
			}

				if(move_right) {
				fg.move(fg.get_x()+delta*speed, fg.get_y());
				if(fg.get_x()+fg.get_width() > get_scene_width()){
					move_right=false;
					move_left=true;
					speed=100;
					bounce++;
				}
			display = "BOUNCE = %d".printf()
				.add(Primitive.for_integer(bounce)).to_string();
			text.set_text(display);		
			}

			if(move_left) {
				fg.move(fg.get_x()-delta*speed, fg.get_y());
				if(fg.get_x() < 0) {
					move_right=true;
					move_left=false;
					speed = 100;
					bounce++;
				}
			display = "BOUNCE = %d".printf()
				.add(Primitive.for_integer(bounce)).to_string();
			text.set_text(display);	
			}			
		}

		public void set_rotation(double angle) {
			rotation = angle;
		}

		public double get_rotation() {
			return(rotation);
		}
	

}