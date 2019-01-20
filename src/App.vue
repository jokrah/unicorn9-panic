<template lang="pug">
	div.inp
		label.inp(for="inp" v-if="!found && !loading")
			input#inp(type="text" placeholder=" " v-model="privateKey" @keyup.enter="statusUpdate()")
			span.label Private Key for recovering
			span.border
		pacman-loader.pacman(:loading="loading")
		.round-button(v-if="found && !loading")
			.round-button-circle(:class="buttonText=='ACTIVATE' ? 'green' : 'red'")
				a.round-button(@click="changeStatus()") {{buttonText}}

</template>

<script>
export { default } from "./App.coffee";
</script>

<style lang="sass">
	.center
		width: 300px
		height: 300px
		position: absolute
		left: 50%
		top: 50%
		margin-left: -150px
		margin-top: -150px

	html, body
			height: 100%

	body
		display: grid
		font-family: Avenir
		-webkit-text-size-adjust: 100%
		-webkit-font-smoothing: antialiased

	*
		box-sizing: border-box

	.inp
		position: relative
		margin: auto
		width: 100%
		max-width: 500px
		//transform: rotateX(45deg) rotateY(-10deg) rotate(25deg) scale(2)
		.label
			position: absolute
			top: 16px
			left: 0
			font-size: 16px
			color: #9098A9
			font-weight: 500
			transform-origin: 0 0
			transition: all .2s ease
		.border
			position: absolute
			bottom: 0
			left: 0
			height: 2px
			width: 100%
			background #0077FF
			transform: scaleX(0)
			transform-origin: 0 0
			transition: all .15s ease
		input
			-webkit-appearance: none
			width: 100%
			border: 0
			font-family: inherit
			padding: 12px 0
			height: 48px
			font-size: 16px
			font-weight: 500
			border-bottom: 2px solid #C8CCD4
			background: none
			border-radius: 0
			color: #223254
			transition: all .15s ease
			&:hover
				background: rgba(#223254,.03)
			&:not(:placeholder-shown)
				+ span
					color #5A667F
					transform: translateY(-26px) scale(.75)
			&:focus
				background: none
				outline: none
				+ span
					color #0077FF
					transform: translateY(-26px) scale(.75)
					+ .border
						transform: scaleX(1)

	.pacman
		margin-left: 13rem
		margin-top: 5rem


	.round-button-circle
		width: 100%
		height: 0
		padding-bottom: 100%
		border-radius: 50%
		border: 10px solid #cfdcec
		overflow: hidden
		background: #4679BD
		box-shadow: 0 0 3px gray
		font-size: 250%


		.round-button-circle:hover
		background: #30588e

	.red
		background: #a70c0c
		cursor: pointer

	.red:hover
		background: #bb0000d1

	.red:active
		background: rgba(108, 0, 0, 0.82)

	.green
		background: #0ca71f
		cursor: pointer

	.green:hover
		background: #0ca71fb0

	.round-button a
		display: block
		float: left
		width: 100%
		padding-top: 50%
		padding-bottom: 50%
		line-height: 1em
		margin-top: -0.5em

		text-align: center
		color: #e2eaf3
		font-family: Verdana
		font-size: 1.2em
		font-weight: bold
		text-decoration: none
</style>
