Projeto criado no Processing para fins acadêmicos

*********************************************************************************************************************

## Onde você aplicou pushMatrix()/popMatrix() e por quê?

- O `pushMatrix()` foi aplicado antes de iniciar as transformações de cada astro (Sol, planetas e luas) para salvar o estado atual do sistema de coordenadas. Isso permite que eu use funções como `translate()` e `rotate()` para posicionar um objeto sem que essas transformações acumulem ou interfiram nos objetos seguintes.
- Após o desenho do objeto, o `popMatrix()` é chamado para restaurar a matriz de coordenadas ao estado anterior. Isso garante a coerência do sistema, impedindo que o movimento de um planeta, por exemplo, desloque a origem de todo o sistema solar de forma indesejada.


## O que mudaria se invertêssemos rotate( ) e translate( ) no planeta ou na lua?

- Se invertermos as funções no Planeta, ele deixaria de transladar ao redor do Sol e passaria a rotacionar apenas em torno do próprio eixo na posição original ficando estático na órbita.
- No caso da Lua, como ela é desenhada dentro do sistema de coordenadas do Planeta, a inversão faz com que ela perca sua órbita independente ao redor de seu astro. Ela passaria a acompanhar a translação do planeta, comportando-se como um ponto fixo que rotaciona apenas em relação ao centro do planeta, mantendo sempre a mesma posição relativa a ele durante o movimento pelo sistema solar.

## Como garantiu que cada órbita é independente das demais? (composição/atualização separada em update( ) e uso de matrizes aninhadas)

- O método `update()` único para cada astro garante o incremento de _theta_ e _orbitSpeed_ de forma independente por instância de Planeta ou Lua.
- Já as matrizes aninhadas (Cada Lua e Planeta chamando a cada `display()` o seu próprio `pushMatrix()` e `popMatrix()`), permite que as transladação e rotação das Luas sejam em relação aos seus Planetas, por `display()` ser chamado antes de `popMatrix()` de Planeta, sendo que o seu _reset_ da matriz permite o isolamento das órbitas entre os Planetas.

*********************************************************************************************************************
<sub> Modified by Lucas Michaelsen. </sub>
