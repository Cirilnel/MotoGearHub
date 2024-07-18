'use strict';

/**
 * Add event on element
 */
const addEventOnElem = function (elem, type, callback) {
  if (!elem) {
    console.error(`Element not found for selector: ${elem}`);
    return; // Verifica se elem esiste
  }

  if (NodeList.prototype.isPrototypeOf(elem) || HTMLCollection.prototype.isPrototypeOf(elem)) {
    for (let i = 0; i < elem.length; i++) {
      elem[i].addEventListener(type, callback);
    }
  } else {
    elem.addEventListener(type, callback);
  }
}

/**
 * Navbar toggle
 */
const navToggler = document.querySelector("[data-nav-toggler]");
const navbar = document.querySelector("[data-navbar]");
const navbarLinks = document.querySelectorAll("[data-nav-link]");

const toggleNavbar = function () {
  if (navbar) navbar.classList.toggle("active");
  if (navToggler) navToggler.classList.toggle("active");
}

addEventOnElem(navToggler, "click", toggleNavbar);

const closeNavbar = function () {
  if (navbar) navbar.classList.remove("active");
  if (navToggler) navToggler.classList.remove("active");
}

addEventOnElem(navbarLinks, "click", closeNavbar);

/**
 * Active header when window scroll down to 100px
 */
const header = document.querySelector("[data-header]");
const backTopBtn = document.querySelector("[data-back-top-btn]");

const activeElemOnScroll = function () {
  if (window.scrollY > 100) {
    if (header) header.classList.add("active");
    if (backTopBtn) backTopBtn.classList.add("active");
  } else {
    if (header) header.classList.remove("active");
    if (backTopBtn) backTopBtn.classList.remove("active");
  }
}

addEventOnElem(window, "scroll", activeElemOnScroll);

// Debug: verifica che gli elementi siano correttamente selezionati
console.log('navToggler:', navToggler);
console.log('navbar:', navbar);
console.log('navbarLinks:', navbarLinks);
console.log('header:', header);
console.log('backTopBtn:', backTopBtn);
