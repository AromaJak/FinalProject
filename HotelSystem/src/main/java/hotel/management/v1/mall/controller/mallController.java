package hotel.management.v1.mall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hotel")
public class mallController {
	
	
	@GetMapping("/mall/itemList")
	public void item() {
		
	}
	@GetMapping("/mall/itemCart")
	public void itemCart() {
		
		
	}
}