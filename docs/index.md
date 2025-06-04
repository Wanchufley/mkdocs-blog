<style>
.card-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
  gap: 1.5rem;
  margin-top: 1rem;
}

.card {
  border-radius: 1rem;
  padding: 1.2rem;
  background-color: var(--md-default-bg-color); /* fallback if no image */
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  color: white;
  box-shadow: 0 1px 3px rgba(0,0,0,0.1);
  transition: 0.2s ease-in-out;
  min-height: 180px;
  display: flex;
  flex-direction: column;
  justify-content: flex-end;
}

.card:hover {
  transform: translateY(-4px);
  box-shadow: 0 4px 12px rgba(0,0,0,0.1);
}

.card h3, .card p {
  margin: 0;
  text-shadow: 0 1px 2px rgba(0,0,0,0.6); /* helps with readability */
}

.card h3 a {
  color: white;
  text-decoration: none;
}
</style>

---
## 📚 Latest Posts

<div class="card-grid">

<div class="card" style="background-image: url('posts/assets/img/ufw-02.jpeg');">
  <h3><a href="posts/post-02-ufw-role"> ufw-role</a></h3>
  <p>Ansible role for setting up UFW, SSH key access, and automation security best practices.</p>
</div>

<div class="card" style="background-image: url('posts/assets/img/dotfiles-02.png');">
  <h3><a href="posts/post-03-dotfile-mgmnt"> Dotfiles Setup</a></h3>
  <p>How I bootstrap a fresh machine with my dotfiles and Git configuration.</p>
</div>

<div class="card" style="background-image: url('posts/assets/img/figurine.png');">
  <h3><a href="posts/post-01-figurine-install"> Figurine Setup</a></h3>
  <p>Add fun ASCII banners to your terminal using <code>figurine</code>.</p>
</div>

<div class="card" style="background-image: url('posts/assets/img/npm.png');">
  <h3><a href="posts/post-04-npm-installation"> NPM Setup</a></h3>
  <p>Get free and local SSL certificates.</p>
</div>

</div>

---

## :label: [Tags](tags/#network)
