# JQuery

## Plan

* Google basic summary of jquery
* Browse docs for jquery
* Search for common uses of jquery
* Implement found common uses of jquery
* Explore and implement interesting uses of jquery in docs
* Take breaks after each implementation to absorb and reflect what was learned

#### Notes

* jQuery is a fast, small, and feature-rich JavaScript library. It makes things like HTML document traversal and manipulation, event handling, animation, and Ajax much simpler with an easy-to-use API that works across a multitude of browsers.
* [jquery docs](https://api.jquery.com/)

#### Common jQuery API Functions

	* find(): Selects elements based on the provided selector string
	* hide(): Hides an element if it was visible
	* show(): Shows an element if it was hidden
	* html(): Gets or sets an inner HTML of an element
	* append() Injects an element into the DOM after the selected element
	* prepend() Injects an element into the DOM before the selected element
	* on(): Attaches an event listener to an element
	* off() Detaches an event listener from an element
	* css(): Gets or sets the style attribute value of an element
	* attr() Gets or sets any attribute of an element
	* val(): Gets or sets the value attribute of an element
	* text(): Gets the combined text of an element and its children
	* each(): Iterates over a set of matched elements

#### Selectors

* Element Selector
	* can select all <p> elements: $("p")
* Id Selector
	* can select id: $("#id")
* Class Selector
	* can select classes: $(".class")
* Select all elements
	* $("*")
* Select element with class
	* Select <p> elements with class="example": $("p.example")
* Select the first element
	* Select first <p> element: $("p:first")
* Select the first list element
	* first <li> from a <ul>: $("ul li:first")
* Select the first list element from every list
	* first <li> from every <ul>: $("ul li:first-child")
* Select all elements with an href attribute
	* $("[href]")
* Select all button elements and input elements of type="button"
	* $(":button")
* Select all even table row elements <tr>
	$("tr:even")
* Select all odd table row elements <tr>
	$("tr:odd")

#### Event Methods

* Mouse Events
	* click()
	* dblclick()
	* mouseenter()
	* mouseleave ()
* Keyboard Events
	* keypress()
	* keydown()
	* keyup()
* Form Events
	* submit()
	* change()
	* focus()
	* blur()
* Document/Window Events
	* load()
	* resize()
	* scroll()
	* unload()

#### Examples

* $("p").hide();
	* This will SELECT all <p> elements on a page and HIDE them
* $("p").click(function()){ $(this).hide(); });
	* This will SELECT the <p> element you CLICK on and HIDE them

## Reflection on studying

#### Most Helpful/Effective Strategies
 
* Understand the purpose of the material(in this case jquery)
* Learn what the basics (calls/functions/methods) are
* Learn what the basic uses are for each of those
* Learn how to use them by themselves
* Then learn how to combine them
* Look at many examples to solidify your research