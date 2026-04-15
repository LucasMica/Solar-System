**Onde theta é incrementado e como orbitSpeed influencia no movimento?**

```java
void update() {
    // Increment the angle to rotate
    theta += orbitspeed;
    // Update the moon
    moon.update();
}
```

**Velocidade da órbita dos planetas:**

```java
orbitspeed = random(0.01, 0.03);
```

**Velocidade da órbita das Luas:**

```java
orbitspeed = random(-0.1, 0.1);
```

Theta é o ângulo que é modificado na chamada de update, onde orbitSpeed é o responsável por ditar a velocidade com que o ângulo é variado.

Quanto a velocidade da Lua, por conta do método random que retorna um valor aleatório entre -0.1 e 0.1, é possível que a lua orbite no sentido anti-horário ou horário, de acordo com o sinal do valor.

O método `update()` de moon, é apenas a incrementação de `theta += orbtspeed;` no método `update()` de planeta, possui também a chamada do método de sua lua: `moon.update();`.