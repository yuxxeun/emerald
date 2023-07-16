<template>
    <div ref="canvasWrapper" class="bg-[conic-gradient(at_top,_var(--tw-gradient-stops))] from-gray-700 via-gray-900 to-black text-center text-center justify-center justify-content-center h-screen">
        <canvas ref="canvas"></canvas>  
    </div>
</template>
  
  <script>
  import * as THREE from 'three';
  
  export default {
    mounted() {
      this.init();  
    },
    methods: {
        init() {
            const scene = new THREE.Scene();
            const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
            const renderer = new THREE.WebGLRenderer({ canvas: this.$refs.canvas, alpha: true });

            renderer.setSize(window.innerWidth, window.innerHeight);


            const vertices = [
                0, 1, 0, // Top vertex
                -1, 0, 1, // Left vertex
                1, 0, 1, // Right vertex
                -1, 0, -1, // Bottom left vertex
                1, 0, -1, // Bottom right vertex

            ];

            const indices = [
                0, 1, 2, // Top face
                0, 2, 4, // Right face
                0, 4, 3, // Bottom face
                0, 3, 1, // Left face
                1, 3, 2, // Front face
                2, 3, 4, // Back face
            ];

            const geometry = new THREE.BufferGeometry();
            geometry.setAttribute('position', new THREE.BufferAttribute(new Float32Array(vertices), 3));
            geometry.setIndex(indices);
            const material = new THREE.MeshBasicMaterial({ color: 0x87ceeb, wireframe: true });
            const diamond = new THREE.Mesh(geometry, material);
            scene.add(diamond);
            camera.position.z = 5;

            const animate = () => {
                requestAnimationFrame(animate);
                diamond.rotation.x += 0.01;
                diamond.rotation.y += 0.01;
                renderer.render(scene, camera);
                };
            animate();
            },
        },
  };
  </script>
  
  <style scoped>
  canvas {
    width: 100%;
    height: 100%;
  }
  </style>