/* style.css */
:root {
  --red-strong: #e11d2d;
  --gold: #f5c85c;
  --bg-dark: #0b0b0d;
  --bg-darker: #05060A;
  --muted: #9aa1a6;
  --glass: rgba(255,255,255,0.03);
  --radius: 12px;
  --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html {
  scroll-behavior: smooth;
  scroll-padding-top: 80px;
}

body {
  font-family: "Inter", system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
  background: linear-gradient(135deg, var(--bg-darker) 0%, var(--bg-dark) 100%);
  color: #e8eef1;
  line-height: 1.6;
  overflow-x: hidden;
}

/* ===== LOADING SCREEN ===== */
.loading-screen {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: var(--bg-dark);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 9999;
  transition: opacity 0.8s ease, visibility 0.8s ease;
}

.loading-screen.loaded {
  opacity: 0;
  visibility: hidden;
}

.loading-content {
  text-align: center;
}

.loading-logo .logo-text {
  font-size: 2.5rem;
  font-weight: 800;
  background: linear-gradient(45deg, var(--red-strong), var(--gold));
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  margin-bottom: 2rem;
  display: block;
}

.loading-bar {
  width: 200px;
  height: 4px;
  background: rgba(255,255,255,0.1);
  border-radius: 10px;
  overflow: hidden;
}

.loading-progress {
  height: 100%;
  width: 0%;
  background: linear-gradient(90deg, var(--red-strong), var(--gold));
  border-radius: 10px;
  animation: loading 2s ease-in-out forwards;
}

@keyframes loading {
  0% { width: 0%; }
  100% { width: 100%; }
}

/* ===== NAVBAR ===== */
.navbar {
  background: rgba(11, 11, 13, 0.95) !important;
  backdrop-filter: blur(20px);
  border-bottom: 1px solid rgba(255,255,255,0.1);
  padding: 1rem 0;
  transition: var(--transition);
  position: fixed;
  width: 100%;
  top: 0;
  z-index: 1000;
}

.navbar-brand {
  font-size: 1.5rem;
  font-weight: 800;
  background: linear-gradient(45deg, var(--red-strong), var(--gold));
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  transition: var(--transition);
}

.brand-animate:hover {
  transform: translateY(-2px);
}

.navbar-nav {
  gap: 1rem;
}

.nav-link {
  color: #dfe7ea !important;
  font-weight: 500;
  padding: 0.5rem 1rem !important;
  border-radius: 8px;
  transition: var(--transition);
  position: relative;
}

.nav-link::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 50%;
  width: 0;
  height: 2px;
  background: var(--gold);
  transition: all 0.3s ease;
  transform: translateX(-50%);
}

.nav-link:hover::after,
.nav-link.active::after {
  width: 80%;
}

.nav-link:hover,
.nav-link.active {
  color: var(--gold) !important;
  background: rgba(255,255,255,0.05);
}

/* ===== HERO SECTION ===== */
.hero {
  min-height: 100vh;
  display: flex;
  align-items: center;
  background: linear-gradient(135deg, 
    rgba(225,29,45,0.15) 0%, 
    rgba(245,200,92,0.08) 100%),
    url('https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?ixlib=rb-4.0.3&auto=format&fit=crop&w=2070&q=80') center/cover;
  position: relative;
  padding-top: 80px;
}

.hero::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(45deg, 
    rgba(11,11,13,0.8) 0%, 
    rgba(11,11,13,0.6) 50%, 
    rgba(11,11,13,0.8) 100%);
}

.hero .container {
  position: relative;
  z-index: 2;
}

.hero h1 {
  font-size: 4rem;
  font-weight: 800;
  background: linear-gradient(45deg, #fff, var(--gold));
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  margin-bottom: 1rem;
  text-shadow: 0 5px 15px rgba(0,0,0,0.3);
}

.hero .lead {
  font-size: 1.5rem;
  color: rgba(255,255,255,0.9);
  margin-bottom: 2rem;
  font-weight: 300;
}

.btn-primary {
  background: linear-gradient(45deg, var(--red-strong), #cf1220);
  border: none;
  border-radius: 50px;
  padding: 1rem 2.5rem;
  font-weight: 600;
  font-size: 1.1rem;
  transition: var(--transition);
  position: relative;
  overflow: hidden;
}

.btn-primary::before {
  content: '';
  position: absolute;
  top: 0;
  left: -100%;
  width: 100%;
  height: 100%;
  background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
  transition: left 0.5s ease;
}

.btn-primary:hover::before {
  left: 100%;
}

.btn-primary:hover {
  transform: translateY(-3px);
  box-shadow: 0 10px 25px rgba(225,29,45,0.4);
}

/* ===== SECTIONS ===== */
section {
  padding: 5rem 0;
  position: relative;
}

.section-bg {
  background: linear-gradient(180deg, 
    rgba(255,255,255,0.01) 0%, 
    rgba(0,0,0,0.03) 100%);
  position: relative;
}

.section-bg::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: 
    radial-gradient(circle at 20% 80%, rgba(225, 29, 45, 0.05) 0%, transparent 50%),
    radial-gradient(circle at 80% 20%, rgba(245, 200, 92, 0.05) 0%, transparent 50%);
  z-index: -1;
}

.section-title {
  font-size: 2.5rem;
  font-weight: 700;
  background: linear-gradient(45deg, var(--red-strong), var(--gold));
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  margin-bottom: 3rem;
  position: relative;
  display: inline-block;
}

.section-title::after {
  content: '';
  position: absolute;
  bottom: -15px;
  left: 0;
  width: 60px;
  height: 4px;
  background: linear-gradient(90deg, var(--red-strong), var(--gold));
  border-radius: 2px;
}

.text-center .section-title::after {
  left: 50%;
  transform: translateX(-50%);
}

/* ===== BIO SECTION ===== */
#bio {
  min-height: 100vh;
  display: flex;
  align-items: center;
}

#bio p {
  font-size: 1.1rem;
  line-height: 1.8;
  color: rgba(255,255,255,0.9);
  margin-bottom: 1.5rem;
}

/* ===== TIMELINE SECTION ===== */
.timeline {
  position: relative;
  margin-top: 3rem;
  padding-left: 2rem;
}

.timeline::before {
  content: "";
  position: absolute;
  left: 30px;
  top: 0;
  bottom: 0;
  width: 4px;
  background: linear-gradient(180deg, var(--red-strong), var(--gold));
  border-radius: 6px;
}

.timeline-item {
  position: relative;
  margin-bottom: 3rem;
  padding-left: 80px;
}

.timeline-badge {
  position: absolute;
  left: -2px;
  top: 0;
  transform: translateX(-50%);
  width: 60px;
  height: 60px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: 800;
  box-shadow: 0 6px 20px rgba(0,0,0,0.4);
  z-index: 2;
  transition: var(--transition);
}

.timeline-badge:hover {
  transform: translateX(-50%) scale(1.1);
}

.bg-danger { 
  background: linear-gradient(45deg, var(--red-strong), #cf1220) !important; 
  color: #fff !important; 
}

.timeline-panel {
  background: rgba(255,255,255,0.03);
  padding: 2rem;
  border-radius: 15px;
  border: 1px solid rgba(255,255,255,0.1);
  backdrop-filter: blur(10px);
  transition: var(--transition);
}

.timeline-panel:hover {
  transform: translateY(-5px);
  border-color: rgba(225, 29, 45, 0.3);
  box-shadow: 0 10px 30px rgba(0,0,0,0.3);
}

.timeline-panel h5 {
  font-size: 1.3rem;
  color: var(--gold);
  margin-bottom: 0.5rem;
  font-weight: 600;
}

.timeline-panel p {
  color: rgba(255,255,255,0.8);
  line-height: 1.6;
  margin: 0;
}

/* ===== GALLERY SECTION ===== */
.card.bg-dark {
  background: rgba(255,255,255,0.02);
  border: 1px solid rgba(255,255,255,0.1);
  border-radius: var(--radius);
  overflow: hidden;
  transition: var(--transition);
  height: 100%;
}

.card.bg-dark:hover {
  transform: translateY(-10px);
  box-shadow: 0 20px 40px rgba(0,0,0,0.4);
  border-color: rgba(225, 29, 45, 0.3);
}

.card-img-top {
  height: 250px;
  object-fit: cover;
  transition: transform 0.3s ease;
}

.card.bg-dark:hover .card-img-top {
  transform: scale(1.05);
}

.card-body {
  padding: 1.5rem;
}

.card-text {
  color: rgba(255,255,255,0.8);
  line-height: 1.6;
}

/* ===== FOOTER ===== */
footer {
  background: rgba(11, 11, 13, 0.95);
  border-top: 1px solid rgba(255,255,255,0.1);
  backdrop-filter: blur(10px);
}

footer p {
  color: var(--muted);
  margin: 0;
}

/* ===== RESPONSIVE DESIGN ===== */
@media (max-width: 768px) {
  .hero h1 {
    font-size: 2.5rem;
  }
  
  .hero .lead {
    font-size: 1.2rem;
  }
  
  .section-title {
    font-size: 2rem;
  }
  
  .timeline::before {
    left: 20px;
  }
  
  .timeline-item {
    padding-left: 60px;
  }
  
  .timeline-badge {
    width: 50px;
    height: 50px;
    font-size: 0.9rem;
  }
  
  .loading-logo .logo-text {
    font-size: 2rem;
  }
}

@media (max-width: 576px) {
  .hero h1 {
    font-size: 2rem;
  }
  
  section {
    padding: 3rem 0;
  }
  
  .container {
    padding-left: 15px;
    padding-right: 15px;
  }
}

/* ===== SCROLLBAR ===== */
::-webkit-scrollbar {
  width: 8px;
}

::-webkit-scrollbar-track {
  background: var(--bg-dark);
}

::-webkit-scrollbar-thumb {
  background: linear-gradient(45deg, var(--red-strong), var(--gold));
  border-radius: 4px;
}

::-webkit-scrollbar-thumb:hover {
  background: linear-gradient(45deg, var(--gold), var(--red-strong));
}

/* ===== SELECTION ===== */
::selection {
  background: rgba(225, 29, 45, 0.3);
  color: white;
}

::-moz-selection {
  background: rgba(225, 29, 45, 0.3);
  color: white;
}

/* ===== ACCESSIBILITY ===== */
:focus-visible {
  outline: 3px solid rgba(245, 200, 92, 0.5);
  outline-offset: 2px;
  border-radius: 4px;
}

/* ===== REDUCED MOTION ===== */
@media (prefers-reduced-motion: reduce) {
  *,
  *::before,
  *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
    scroll-behavior: auto !important;
  }
}

/* ===== BOOTSTRAP OVERRIDES ===== */
.navbar-toggler {
  border: 1px solid rgba(255,255,255,0.2);
}

.navbar-toggler:focus {
  box-shadow: 0 0 0 2px rgba(245, 200, 92, 0.25);
}

.btn {
  border-radius: 8px;
}

/* ===== AOS ANIMATIONS INTEGRATION ===== */
[data-aos] {
  transition-duration: 0.8s;
}
